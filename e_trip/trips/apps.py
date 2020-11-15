from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _

class TripsConfig(AppConfig):
    name = 'e_trip.trips'
    verbose_name = _("Manage Trips and Bids")

    def ready(self):
        try:
            import e_trip.trips.signals  # noqa F401
        except ImportError:
            pass
