from django.contrib.auth.models import AbstractUser
from django.db.models import CharField
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.db import models
#from django.contrib.gis.db import models as geo_models

import uuid

class User(AbstractUser):
    """Default user for E Trip."""
    TYPE_VALUE_MAP = {
        "user":0,
        "Admin": 20,
        "SuperAdmin": 25,
        }
    TYPE_CHOICES = [(value, name) for name, value in TYPE_VALUE_MAP.items()]
    user_type = models.IntegerField(choices=TYPE_CHOICES, blank=True, default=0)

    #: First and last name do not cover name patterns around the globe
    name = CharField(_("Name of User"), blank=True, max_length=255)
    phone = models.CharField(blank=True,max_length=10)
    uuid = models.UUIDField(default=uuid.uuid4, editable=False)
    def get_absolute_url(self):
        """Get url for user's detail view.

        Returns:
            str: URL for user detail.

        """
        return reverse("users:detail", kwargs={"username": self.username})

class Driver(models.Model):
    user = models.OneToOneField('User',on_delete=models.CASCADE)
    vehicles = models.ManyToManyField('vehicles.Vehicle',blank=True)
    status = models.BooleanField(default=True)
