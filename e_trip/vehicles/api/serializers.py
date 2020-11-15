from django.contrib.auth import get_user_model
from rest_framework import serializers
from django.conf import settings
import requests
import logging
import boto3
from botocore.exceptions import ClientError
from botocore.client import Config

from e_trip.vehicles.models import Vehicle, DriverVehicle
from e_trip.users.models import Driver

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

class AWSImageField(serializers.ImageField):
    def to_representation(self, value):
        if not value:
            return None

        # `media/` is `MEDIA_URL`, but it is being used with `public-config`. I don't want to mess up the common use case
        url = create_presigned_url(settings.AWS_STORAGE_BUCKET_NAME, 'media/' + value.name)
        if url is not None:
            res = requests.get(url)

        return res.url


class VehicleSerializer(serializers.ModelSerializer):
    icon = AWSImageField()
    class Meta:
        model = Vehicle
        fields = '__all__'

class DriverVehicleSerializer(serializers.ModelSerializer):
    class Meta:
        model = DriverVehicle
        fields = ["vehicle", "photo", "vehicle_no"]
    def validate(self, data):
        user = self.context.get('request').user
        driver = get_object_or_404(Driver, user=user)
        return data
    def create(self, validated_data):
        user = self.context.get('request').user
        driver = get_object_or_404(Driver, user=user)
        validated_data['driver'] = driver
        driver_vehicle = super(DriverVehicleSerializer, self).create(validated_data)
        driver_vehicle.save()
        return driver_vehicle

class DriverVehicleListSerializer(serializers.ModelSerializer):
    icon = AWSImageField()
    class Meta:
        model = Vehicle
        fields = '__all__'
