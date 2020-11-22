from django.db import models

import os
from django.utils import timezone
from datetime import datetime

def admin_directory_path(instance, filename):
    basefilename, file_extension= os.path.splitext(filename)
    timenow = timezone.now()
    return 'admin/ads/{basename}{time}{ext}'.format(basename=basefilename, time=timenow.strftime("%Y%m%d%H%M%S"), ext=file_extension)

class Advertisement(models.Model):
    name = models.CharField(max_length=50,default='Default Ads')
    ad_banner = models.FileField(upload_to=admin_directory_path, default='file.jpeg',help_text="Ad Slider Image")
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.name
        
class ProjectProfile(models.Model):
    profile_name = models.CharField(max_length=50,default='Default Profile')
    max_bid_notification_limit = models.IntegerField(default=10)
    max_bid_search_range = models.DecimalField(max_digits=8, decimal_places=2, null=True,blank=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return self.profile_name
