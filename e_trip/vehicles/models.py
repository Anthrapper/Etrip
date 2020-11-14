from django.db import models

# Create your models here.

import os
from django.utils import timezone
from datetime import datetime

def material_directory_path(instance, filename):
    basefilename, file_extension= os.path.splitext(filename)
    timenow = timezone.now()
    return 'assets/icons/{basename}{time}{ext}'.format( basename=basefilename, time=timenow.strftime("%Y%m%d%H%M%S"), ext=file_extension)


class Vehicle(models.Model):
    name = models.CharField(max_length=10)
    icon = models.FileField(upload_to=material_directory_path, default='file.pdf',help_text="Display Icon")
    #icon = models.URLField()
    def __str__(self):
        return self.name
