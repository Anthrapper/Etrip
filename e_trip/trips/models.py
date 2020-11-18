from django.db import models
from django.contrib.gis.db import models as geo_models
from django.contrib.gis.geos import Point
import os
from django.utils import timezone
from datetime import datetime

class Trip(models.Model):
    from_place_coordinates = geo_models.PointField(default=Point(0.0, 0.0))
    to_place_coordinates = geo_models.PointField(default=Point(0.0, 0.0))
    date =  models.DateTimeField(default=timezone.now)
    from_place = models.CharField(blank=True,max_length=200)
    to_place = models.CharField(blank=True,max_length=200)
    user = models.ForeignKey('users.User',on_delete=models.CASCADE,blank=True,null=True)
    driver = models.ForeignKey('users.Driver',on_delete=models.CASCADE,blank=True, null=True)
    amount = models.DecimalField(max_digits=8, decimal_places=2, null=True)
    TYPE_VALUE_MAP = {
        "OnBid":0,
        "BidSelected": 1,
        "Cancelled": 2,
        "EnRoute" :3,
        "Completed":4
        }
    TYPE_CHOICES = [(value, name) for name, value in TYPE_VALUE_MAP.items()]
    models.IntegerField(choices=TYPE_CHOICES, blank=True, default=0)
    def __str__(self):
        return self.user.username + " " + self.from_place + " to " + self.to_place
