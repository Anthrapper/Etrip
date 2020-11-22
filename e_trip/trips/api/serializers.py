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
    from_place_coordinates = serializers.SerializerMethodField()
    to_place_coordinates = serializers.SerializerMethodField()
    trip_status = serializers.SerializerMethodField()
    vehicle =  serializers.SerializerMethodField()
    date = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S")
    class Meta:
        model = Trip
        fields = '__all__'
    def get_from_place_coordinates(slef,obj):
        print(obj.from_place_coordinates)
        return [obj.from_place_coordinates.x,obj.from_place_coordinates.y]
    def get_to_place_coordinates(slef,obj):
        return [obj.to_place_coordinates.x, obj.to_place_coordinates.y]
    def get_trip_status(self,obj):
        print(Trip.TYPE_CHOICES)
        return Trip.TYPE_CHOICES[obj.trip_status][1]
    def get_vehicle(self,obj):
        if obj.vehicle:
            return [obj.vehicle.name, obj.vehicle.id]
        return obj.vehicle

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

class DriverBidListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bid
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


class TripBidSelectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bid
        fields = ['id','status']
    def validate(self,data):
        #data['user'] = self.context.get('request').user
        print(data)
        bid = get_object_or_404(Bid,id=data['id'])
        if not Trip.objects.filter(user=self.context.get('request').user).filter(id= bid.trip.id).exists():
            raise serializers.ValidationError("No Driver User Found")
        else:
            #data['user'] = self.context.get('request').user
            pass
        return data
