import numpy as np
from scipy.optimize import curve_fit
from scipy.ndimage import center_of_mass
from scipy.stats import skew, kurtosis

class BeamProfiler:
    def __init__(self, **kwargs):
        self.pixel_size = kwargs['Pixel Size']
          # Accepts either image file or array input
        self.centroid_x = None
        self.centroid_y = None
        self.beam_width_x = None
        self.beam_width_y = None
        self.ellipticity = None
        self.error_message = None  # For error handling
        self.rotation = None
        self.asymmetry = None
        self.power_density = None
        self.total_power = None
        self.x_profile = None
        self.y_profile = None
        self.init_done = True
    
    def calculate_values(self, image):
        
        if image is None or len(image) == 0:
            self.error_message = "Image data is empty or invalid."
            return
        else:
            self.image = np.array(image)
            self.error_message = None
            self._calculate_centroid()
            self._calculate_profile_rotation_angle()
            self._calculate_beam_width()
            self._calculate_asymmetry()
            self._calculate_power()
            self._calculate_power_density()
            self._calculate_intensity_profile()
            # self._calculate_gaussian_fit_error()
            self._calculate_flatness()
            self._measure_skewness()
            self._measure_kurtosis()
            beam_profiler_data = {'Centroid':{'x':str(self.x_o),'y':str(self.y_o)},'Beam Width':{'x':str(self.beam_width_x),'y':str(self.beam_width_y)},
                                'Asymmetry':str(self.asymmetry),'Angle':str(self.rotation)}#,'Skewness':self.skewness,'Kurtosis':self.kurtosis}
            return beam_profiler_data

    def _gaussian(self, x, a, x0, sigma):
        """Gaussian function for fitting."""
        return a * np.exp(-(x - x0)**2 / (2 * sigma**2))

    def _calculate_centroid(self, threshold_ratio=1):
        """Calculate the centroid of the beam, applying a threshold to reduce background noise."""
        try:
            # Apply threshold to filter out background noise, as a percentage of max intensity
            max_intensity = np.max(self.image)
            threshold = threshold_ratio * max_intensity
            thresholded_image = np.where(self.image >= threshold, self.image, 0)

            # Calculate the centroid based on the thresholded image
            centroid_y, centroid_x = center_of_mass(thresholded_image)

            # Save calculated values and round for output clarity
            self.centroid_x = round(centroid_x, 3)
            self.centroid_y = round(centroid_y, 3)

        except Exception as e:
            # Reset attributes and log error if computation fails
            self.centroid_x, self.centroid_y = None, None
            self.error_message = f"Centroid calculation failed: {e}"


    def _calculate_beam_width(self):
        """Calculate the beam width along X and Y using Gaussian fitting, with fallback to moments."""
        if self.centroid_x is None or self.centroid_y is None:
            self.error_message = "Centroid not defined. Unable to calculate beam width."
            return

        try:
            # Get profiles along the X and Y axes at the centroid
            x_profile = self.image[int(self.centroid_y), :]
            y_profile = self.image[:, int(self.centroid_x)]
            
            x = np.arange(x_profile.size)
            y = np.arange(y_profile.size)
            
            # Check if profiles are close to Gaussian; if not, skip fitting
            if not self._is_gaussian_like(x_profile) or not self._is_gaussian_like(y_profile):
                raise RuntimeError("Profile data too noisy or irregular for Gaussian fit.")

            # Dynamic initial guesses for Gaussian fit
            x_initial = [x_profile.max(), self.centroid_x, max(np.std(x_profile), 10)]
            y_initial = [y_profile.max(), self.centroid_y, max(np.std(y_profile), 10)]

            # Attempt Gaussian fitting
            self._popt_x, _ = curve_fit(self._gaussian, x, x_profile, p0=x_initial)
            self._popt_y, _ = curve_fit(self._gaussian, y, y_profile, p0=y_initial)

            # Compute widths and convert to real units
            self.beam_width_x = round(2 * self._popt_x[2] * self.pixel_size, 3)
            self.beam_width_y = round(2 * self._popt_y[2] * self.pixel_size, 3)

            self.x_o = round(self._popt_x[1])
            self.y_o = round(self._popt_y[1])

            # Calculate ellipticity as the ratio of X to Y beam widths
            self.ellipticity = round(self.beam_width_x / self.beam_width_y, 3)

        except RuntimeError:
            # Fallback: Use second moment to approximate beam width if fit fails
            self.beam_width_x = round(2 * np.sqrt(np.sum((x - self.centroid_x)**2 * x_profile) / np.sum(x_profile)) * self.pixel_size, 3)
            self.beam_width_y = round(2 * np.sqrt(np.sum((y - self.centroid_y)**2 * y_profile) / np.sum(y_profile)) * self.pixel_size, 3)
            self.ellipticity = round(self.beam_width_x / self.beam_width_y, 3)
            self._log_error("Gaussian fit failed. Beam width estimated using second moment.")

        except Exception as e:
            # Handle any other exceptions and log an error
            self.beam_width_x, self.beam_width_y, self.ellipticity = None, None, None
            self.error_message = f"Beam width calculation failed: {e}"
            self._log_error(self.error_message)

    def _is_gaussian_like(self, profile):
        """Quick check if a profile is likely Gaussian-shaped using width at half max."""
        half_max = profile.max() / 2
        above_half_max = np.where(profile >= half_max)[0]
        if len(above_half_max) < 3:
            return False  # Not enough points at high intensity to fit a Gaussian
        return True


    def _calculate_intensity_profile(self):
        """Calculate the 1D intensity profile along the X and Y axes."""
        try:
            self.x_profile = self.image[int(self.centroid_y), :]
            self.y_profile = self.image[:, int(self.centroid_x)]
        except Exception as e:
            self.x_profile = None
            self.y_profile = None
            self.error_message = f"Intensity profile calculation failed: {e}"

    def _calculate_power(self):
        """Calculate the total power (sum of pixel intensities)."""
        try:
            self.total_power = round(np.sum(self.image),3)
        except Exception as e:
            self.total_power = None
            self.error_message = f"Power calculation failed: {e}"

    def _calculate_asymmetry(self):
        """Calculate the asymmetry between X and Y beam widths."""
        try:
            self.asymmetry = round(abs(self.beam_width_x - self.beam_width_y) / max(self.beam_width_x, self.beam_width_y),4)
        except Exception as e:
            self.asymmetry = None
            self.error_message = f"Asymmetry calculation failed: {e}"

    def _calculate_gaussian_fit_error(self):
        
        x = np.arange(self.x_profile.size)
        y = np.arange(self.y_profile.size)

        try:
            residual_x = self.x_profile - self._gaussian(x, *self._popt_x)
            residual_y = self.y_profile - self._gaussian(y, *self._popt_y)

            self.fit_error = np.sqrt(np.mean(residual_x**2) + np.mean(residual_y**2))
            
        except RuntimeError:
            self.fit_error = None
            self.error_message = "Gaussian fit error calculation failed due to fit failure."

    def _calculate_profile_rotation_angle(self):
        """Estimate rotation angle of the beam profile using moment analysis."""
        def map_angle(angle):
            """Maps an angle to the range [-89, 90]."""
            if angle > 90:
                angle -= 180
            elif angle < -90:
                angle += 180
            return angle
    
        try:
            y, x = np.indices(self.image.shape)
            x_mean = (x * self.image).sum() / self.image.sum()
            y_mean = (y * self.image).sum() / self.image.sum()

            x_diff = x - x_mean
            y_diff = y - y_mean

            covariance_matrix = np.array([
                [(x_diff**2 * self.image).sum(), (x_diff * y_diff * self.image).sum()],
                [(x_diff * y_diff * self.image).sum(), (y_diff**2 * self.image).sum()]
            ])

            self.eigenvalues, self.eigenvectors = np.linalg.eig(covariance_matrix)
            angle = np.arctan2(self.eigenvectors[1, 0], self.eigenvectors[0, 0])
        
            self.rotation = round(np.degrees(angle),3)

        except Exception as e:
            angle = None
            self.error_message = f"Rotation angle calculation failed: {e}"
            self.rotation = None

    def _calculate_power_density(self):

        try:
            if self.total_power is None or self.beam_width_x is None or self.beam_width_y is None:
                raise ValueError("Beam width or power not available.")

            area = np.pi * (self.beam_width_x / 2) * (self.beam_width_y / 2)
            self.power_density = round(self.total_power / area,3)
        except Exception as e:
            self.power_density = None
            self.error_message = f"Power density calculation failed: {e}"

    def _calculate_flatness(self):
        """Calculate the flatness of the beam profile."""
        try:
            # Take the intensity profile along the X-axis (or Y-axis, depending on your preference)
            profile = self.image[int(self.centroid_y), :]  # You can also use self.image[:, int(self.centroid[0])] for the Y-axis
            
            # Calculate the standard deviation of the profile intensity values
            flatness_value = np.std(profile)
            self.flatness = round(flatness_value,3)
        except Exception as e:
            self.flatness = None
            self.error_message = f"Flatness calculation failed: {e}"

    def _measure_skewness(self):
        flat_image = self.image.flatten()
        self.skewness = round(skew(flat_image),3)

    def _measure_kurtosis(self):
        flat_image = self.image.flatten()
        self.kurtosis = round(kurtosis(flat_image,fisher=False),3)

    def _log_error(self, message):
        self.error_message = message
