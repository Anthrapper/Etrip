from django.db import models

# Create your models here.

import os
from django.utils import timezone
from datetime import datetime
from django.contrib.gis.db import models as geo_models
from django.contrib.gis.geos import Point

def material_directory_path(instance, filename):
    basefilename, file_extension= os.path.splitext(filename)
    timenow = timezone.now()
    return 'assets/icons/{basename}{time}{ext}'.format( basename=basefilename, time=timenow.strftime("%Y%m%d%H%M%S"), ext=file_extension)

def driver_directory_path(instance, filename):
    basefilename, file_extension= os.path.splitext(filename)
    timenow = timezone.now()
    return 'driver/{username}/vehicles/{basename}{time}{ext}'.format( username=instance.user.username,basename=basefilename, time=timenow.strftime("%Y%m%d%H%M%S"), ext=file_extension)

class Vehicle(models.Model):
    name = models.CharField(max_length=10)
    icon = models.FileField(upload_to=material_directory_path, default='icon.png',help_text="Display Icon")
    #icon = models.URLField()
    def __str__(self):
        return self.name

class DriverVehicle(models.Model):
    driver = models.ForeignKey(
        'users.Driver',
        on_delete=models.CASCADE,
    )
    vehicle = models.ForeignKey(
        'Vehicle',
        on_delete=models.CASCADE,
    )
    photo = models.FileField(upload_to=driver_directory_path, default='file.jpeg',help_text="Vehicle Image")
    vehicle_no = models.CharField(max_length=30)
    is_permited = models.BooleanField(default=True)
    last_location = geo_models.PointField(default=Point(0.0, 0.0))
    last_location_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.driver.user.username
