import numpy as np
from scipy.optimize import curve_fit
from scipy.ndimage import center_of_mass

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
        self.image = np.array(image)
        self._calculate_centroid()
        self._calculate_profile_rotation_angle()
        self._calculate_intensity_profile()
        self._calculate_beam_width()
        self._calculate_asymmetry()
        self._calculate_power()
        self._calculate_power_density()
        # self._calculate_gaussian_fit_error()
        # self._calculate_flatness()
        beam_profiler_data = {'Centroid':{'x':str(self.centroid_x),'y':str(self.centroid_y)},'Beam Width':{'x':str(self.beam_width_x),'y':str(self.beam_width_y)},
                              'Asymmetry':str(self.asymmetry),'Angle':str(self.rotation)}
        return beam_profiler_data

    def _gaussian(self, x, a, x0, sigma):
        """Gaussian function for fitting."""
        return a * np.exp(-(x - x0)**2 / (2 * sigma**2))

    def _calculate_centroid(self):
        """Calculate the centroid of the beam with an optional intensity threshold to reduce noise influence."""
        try:
            # Apply threshold to ignore background noise; threshold as a percentage of the max intensity
            max_intensity = np.max(self.image)
       
            # Calculate centroid of thresholded image
            centroid_y, centroid_x = center_of_mass(self.image)
            self.centroid_x,self.centroid_y = round(centroid_x,3), round(centroid_y,3)
            self.error_message = None
        except Exception as e:
            self.centroid_x,self.centroid_y = None, None
            self.error_message = f"Centroid calculation failed: {e}"

    def _calculate_beam_width(self):
        """Calculate the beam width along X and Y using Gaussian fit."""
        # if self.centroid is None:
        #     self.calculate_centroid()
        
        x_guess = self.beam_width_x if self.beam_width_x else 10
        y_guess = self.beam_width_y if self.beam_width_y else 10

        x_profile = self.image[int(self.centroid_x), :]
        y_profile = self.image[:, int(self.centroid_y)]

        x = np.arange(x_profile.size)
        y = np.arange(y_profile.size)

        try:
            self._popt_x, _ = curve_fit(self._gaussian, x, x_profile, p0=[x_profile.max(), self.centroid_x, x_guess])
            self._popt_y, _ = curve_fit(self._gaussian, y, y_profile, p0=[y_profile.max(), self.centroid_y, y_guess])
        
        # TODO: Beam Width Error
        
            self.beam_width_x = round(2 * self._popt_x[2] * self.pixel_size,3)
            self.beam_width_y = round(2 * self._popt_y[2] * self.pixel_size,3)
            self.ellipticity = self.beam_width_x / self.beam_width_y
            self.error_message = None

        except RuntimeError:
            self.error_message = "Gaussian fit failed. Beam widths and ellipticity are unavailable."
            self.beam_width_x = None
            self.beam_width_y = None
            self.ellipticity = None

    def _calculate_intensity_profile(self):
        """Calculate the 1D intensity profile along the X and Y axes."""
        # if self.centroid is None:
        #     self.calculate_centroid()

        try:
            self.x_profile = self.image[int(self.centroid_x), :]
            self.y_profile = self.image[:, int(self.centroid_y)]
            self.error_message = None
        except Exception as e:
            self.x_profile = None
            self.y_profile = None
            self.error_message = f"Intensity profile calculation failed: {e}"

    def _calculate_power(self):
        """Calculate the total power (sum of pixel intensities)."""
        try:
            self.total_power = round(np.sum(self.image),3)
            self.error_message = None
        except Exception as e:
            self.total_power = None
            self.error_message = f"Power calculation failed: {e}"

    def _calculate_asymmetry(self):
        """Calculate the asymmetry between X and Y beam widths."""
        # if self.beam_width_x is None or self.beam_width_y is None:
        #     self.calculate_beam_width()

        try:
            self.asymmetry = round(abs(self.beam_width_x - self.beam_width_y) / max(self.beam_width_x, self.beam_width_y),4)
            self.error_message = None
        except Exception as e:
            self.asymmetry = None
            self.error_message = f"Asymmetry calculation failed: {e}"

    def _calculate_gaussian_fit_error(self):
        """Estimate fit quality by calculating residuals from the Gaussian model."""
        # if self.centroid is None:
        #     self.calculate_centroid()

        x = np.arange(self.x_profile.size)
        y = np.arange(self.y_profile.size)

        try:
            residual_x = self.x_profile - self._gaussian(x, *self._popt_x)
            residual_y = self.y_profile - self._gaussian(y, *self._popt_y)

            self.fit_error = np.sqrt(np.mean(residual_x**2) + np.mean(residual_y**2))
            self.error_message = None
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
        
            self.error_message = None
            self.rotation = round(np.degrees(angle),3)

        except Exception as e:
            angle = None
            self.error_message = f"Rotation angle calculation failed: {e}"
            self.rotation = None

    def _calculate_power_density(self):
        """Calculate the power density by dividing total power by beam area."""
        # if self.beam_width_x is None or self.beam_width_y is None:
        #     self.calculate_beam_width()

        try:
            if self.total_power is None or self.beam_width_x is None or self.beam_width_y is None:
                raise ValueError("Beam width or power not available.")

            area = np.pi * (self.beam_width_x / 2) * (self.beam_width_y / 2)
            self.power_density = round(self.total_power / area,3)
            self.error_message = None
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
            self.error_message = None
        except Exception as e:
            self.flatness = None
            self.error_message = f"Flatness calculation failed: {e}"
