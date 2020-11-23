from django.contrib.auth import get_user_model
from rest_framework import serializers
from django.shortcuts import get_list_or_404, get_object_or_404
from django.conf import settings
import requests
import logging
import boto3
from botocore.exceptions import ClientError
from botocore.client import Config

from e_trip.trips.models import Trip, Bid, Notification
from e_trip.users.models import Driver
from e_trip.vehicles.models import DriverVehicle

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
    from_place = serializers.SerializerMethodField()
    to_place = serializers.SerializerMethodField()
    travel_date = serializers.SerializerMethodField()
    vehicle = serializers.SerializerMethodField()
    trip_status = serializers.SerializerMethodField()
    class Meta:
        model = Bid
        fields = '__all__'
    def get_from_place(self, obj):
        return obj.trip.from_place
    def get_to_place(self,obj):
        return obj.trip.to_place
    def get_travel_date(self, obj):
        date = obj.trip.date.strftime("%Y-%m-%d %H:%M:%S")
        return date
    def get_vehicle(self, obj):
        return obj.trip.vehicle.name
    def get_trip_status(self,obj):
        return Bid.TYPE_CHOICES[obj.status][1]
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


logger = logging.getLogger('django')

def create_presigned_url(bucket_name, object_name, expiration=3600):
    """Generate a presigned URL to share an S3 object

    :param bucket_name: string
    :param object_name: string
    :param expiration: Time in seconds for the presigned URL to remain valid
    :return: Presigned URL as string. If error, returns None.
    """

    # Generate a presigned URL for the S3 object
    s3_client = boto3.client('s3',
                      config=Config(signature_version='s3v4'),
                      aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
                      aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
                      region_name=settings.AWS_S3_REGION_NAME
    )
    try:
        response = s3_client.generate_presigned_url('get_object',
                                                    Params={'Bucket': bucket_name,
                                                            'Key': object_name},
                                                    ExpiresIn=expiration)
    except ClientError as e:
        logging.error(e)
        return None

    # The response contains the presigned URL
    return response

class BidLogSerializer(serializers.ModelSerializer):
    driver = serializers.SerializerMethodField()
    vehicle = serializers.SerializerMethodField()
    class Meta:
        model = Bid
        fields = '__all__'
    def get_driver(self,obj):
        return obj.driver.user.name
    def get_vehicle(self,obj):
        driver = obj.driver
        trip = get_object_or_404(Trip, id=obj.trip.id)
        vehicle = DriverVehicle.objects.filter(vehicle = trip.vehicle).first()
        url = create_presigned_url(settings.AWS_STORAGE_BUCKET_NAME, 'media/' + vehicle.photo.name)
        res = requests.get(url)
        return res.url

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

class NotificationListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notification
        fields = '__all__'
