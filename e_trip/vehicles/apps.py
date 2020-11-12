from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class VehiclesConfig(AppConfig):
    name = "e_trip.vehicles"
    verbose_name = _("Vehicles")

    def ready(self):
        try:
            import e_trip.vehicles.signals  # noqa F401
        except ImportError:
            pass
