from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _

class ManagementConfig(AppConfig):
    name = 'e_trip.management'
    verbose_name = _("Manage Trip Limits , Driver Search Range and Advertisement")
    def ready(self):
        try:
            import e_trip.management.signals  # noqa F401
        except ImportError:
            pass
