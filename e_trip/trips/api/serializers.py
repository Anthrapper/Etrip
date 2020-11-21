from django.contrib.auth import get_user_model
from rest_framework import serializers
from django.conf import settings
import requests
import logging
import boto3
from botocore.exceptions import ClientError
from botocore.client import Config

from e_trip.trips.models import Trip

class UserTripCreateSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    class Meta:
        model = Trip
        fields = '__all__'
    def get_user(self,obj):
        print(self.context.get('request').user)
        return self.context.get('request').user.id
