from django.db import models

# Create your models here.

class Vehicle(models.Model):
    name = models.CharField(max_length=10)
    icon = models.URLField()
