from abc import ABC, abstractmethod
import numpy as np



class SLM(ABC):
    """Base class for all SLMs."""

    @abstractmethod
    def upload_phase(self) -> None:
        """Uploads a numpy array on the SLM Display.

        Returns
        -------
        None
        """
        pass

    @abstractmethod
    def get_Size(self) -> tuple:
        """Returns the Size of the SLM Display.

        Returns
        -------
        tuple
            (x_size, y_size) of SLM screen.
        """
        pass

