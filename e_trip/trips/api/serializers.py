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
    class Meta:
        model = Trip
        fields = '__all__'

    def create(self, validated_data):
        user = self.context.get('request').user
        validated_data['user'] = user
        user_trip = super(UserTripCreateSerializer, self).create(validated_data)
        user_trip.save()
        return user_trip

class UserTripListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = '__all__'
