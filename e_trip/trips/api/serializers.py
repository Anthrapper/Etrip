from django.contrib.auth import get_user_model
from rest_framework import serializers
from django.shortcuts import get_list_or_404, get_object_or_404
from django.conf import settings
import requests
import logging
import boto3
from botocore.exceptions import ClientError
from botocore.client import Config

from e_trip.trips.models import Trip, Bid
from e_trip.users.models import Driver

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

class DriverBidCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bid
        fields = '__all__'
    def create(self, validated_data):
        user = self.context.get('request').user
        driver = get_object_or_404(Driver, user=user)
        validated_data['driver'] = driver
        driver_bid = super(DriverBidCreateSerializer, self).create(validated_data)
        driver_bid.status = 1
        driver_bid.save()
        return driver_bid
