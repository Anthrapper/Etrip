from django.contrib.auth import get_user_model
from rest_framework import status
from rest_framework.decorators import action
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework import generics
from django.shortcuts import get_list_or_404, get_object_or_404
from django.db.models import Q
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import authentication, permissions
from django.contrib.auth.models import User
from rest_framework.generics import CreateAPIView ,UpdateAPIView
from rest_framework.permissions import AllowAny
from django.shortcuts import get_list_or_404, get_object_or_404
from django.contrib.gis.measure import D
from django.conf import settings

from .serializers import UserTripCreateSerializer, UserTripListSerializer,TripBidSelectSerializer,BidLogSerializer
from .serializers import DriverBidCreateSerializer, DriverBidListSerializer ,NotificationListSerializer , TripBidSelectSerializer
from e_trip.trips.models import Trip,Bid,Notification
from e_trip.users.models import Driver
from e_trip.users.models import User as BaseUser

from pyfcm import FCMNotification

from twilio.rest import Client


twilio_client = Client(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
push_service = FCMNotification(api_key=settings.FIREBASE_FCM)

class CreateTripUser(CreateAPIView):
    serializer_class = UserTripCreateSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        trip=serializer.instance
        drivers = Driver.objects.filter(current_place_coordinates = (trip.from_place_coordinates, D(km=25)))
        print(drivers)
        device_ids = drivers.values_list('user__device_id',flat=True)
        message_title = 'New Work Available : Trip To ' + trip.to_place
        message_body = 'A new trip requested from ' + trip.from_place + ' to ' + trip.to_place + ' on ' + trip.date.strftime("%Y-%m-%d %H:%M:%S")
        try:
            push_service.notify_multiple_devices(registration_ids = list(device_ids), message_title=message_title, message_body=message_body)
        except:
            print('Sending ERROR')
        try:
            notify = Notification(message=message_body,title=message_title,type=0)
            notify.save()
            notify.users.set(BaseUser.objects.filter(device_id__in=list(device_ids)))
            notify.save()
        except:
            print('Notification object Create ERROR')
        headers = self.get_success_headers(serializer.data)
        create_message = {"message": "Trip Created"}
        return Response(
            {**serializer.data, **create_message},
            status=status.HTTP_201_CREATED,
            headers=headers
        )


class NotificationList(generics.ListAPIView):
    serializer_class = NotificationListSerializer
    queryset = Notification.objects.all()

    def get_queryset(self):
        user = self.request.user
        return Notification.objects.filter(users=user)

class UserTripList(generics.ListAPIView):
    serializer_class = UserTripListSerializer
    queryset =Trip.objects.all()

    def get_queryset(self):
        user = self.request.user
        return Trip.objects.filter(user=user).filter(trip_status = 0)

class CreateBidDriver(CreateAPIView):
    serializer_class = DriverBidCreateSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        bid = serializer.instance
        device_id = bid.trip.user.device_id
        message_title = 'A new offer from : ' + bid.driver.user.username + ' for Your Trip To ' + bid.trip.to_place
        message_body = bid.driver.user.username + ' offered an attractive bid on your trip : '+ bid.trip.from_place + ' to ' + bid.trip.to_place + ' on ' + bid.trip.date.strftime("%Y-%m-%d %H:%M:%S")
        try:
            push_service.notify_single_device(registration_id=device_id, message_title=message_title, message_body=message_body)
        except:
            print('Sending ERROR')
        try:
            notify = Notification(message=message_body,title=message_title,type=1)
            notify.save()
            notify.users.set(BaseUser.objects.filter(id=bid.trip.user.id))
            notify.save()
        except:
            print('Notification object Create ERROR')
        create_message = {"message": "Bid Created"}
        return Response(
            {**serializer.data, **create_message},
            status=status.HTTP_201_CREATED,
            headers=headers
        )

class DriverBidList(generics.ListAPIView):
    serializer_class = DriverBidListSerializer
    queryset =Bid.objects.all()

    def get_queryset(self):
        user = self.request.user
        driver = get_object_or_404(Driver,user = user)
        return Bid.objects.filter(driver=driver).filter(status = 1)

class DriverTripList(generics.ListAPIView):
    serializer_class = UserTripListSerializer
    queryset =Trip.objects.all()

    def get_queryset(self):
        user = self.request.user
        driver = get_object_or_404(Driver,user = user)
        vehicle_filter = Trip.objects.filter(trip_status = 0).filter(vehicle__in=driver.vehicles.all())
        distance_filter = vehicle_filter.filter(from_place_coordinates__distance_lte =(driver.current_place_coordinates,D(km=25)))
        return distance_filter

class BidLogsByTrip(generics.ListAPIView):
    serializer_class = BidLogSerializer
    queryset =Bid.objects.all()

    def get_queryset(self):
        id = self.kwargs.get('id')
        trip = get_object_or_404(Trip, id=id)
        bids = Bid.objects.filter(trip=trip)
        return bids

class UserTripListCompleted(generics.ListAPIView):
    serializer_class = UserTripListSerializer
    queryset =Trip.objects.all()

    def get_queryset(self):
        user = self.request.user
        return Trip.objects.filter(user=user).filter(trip_status = 4)


class TripUpdate(UpdateAPIView):
    serializer_class = TripBidSelectSerializer
    queryset = Trip.objects.all()

    def get_object(self):
        id = self.kwargs.get('id')
        print(id)
        obj = get_object_or_404(Trip,id=id)
        return obj
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        trip=serializer.instance
        trip= get_object_or_404(Trip, id=trip.id)
        message = twilio_client.messages.create(
                              from_= settings.TWILIO_PHONE,
                              body='Congrats Your Bid Got Selected For the Trip  - \n from {} to {} \n on : {} \n for more details about the traveller login to the app'.format(
                              trip.to_place,
                              trip.from_place,
                              trip.date.strftime("%Y-%m-%d %H:%M")
                              ),
                              to=str('+91')+trip.selected_bid.driver.user.phone
                          )
        device_id = trip.selected_bid.driver.user.device_id
        print(trip)
        message_title = 'Congrats ! Your Bid Got Approved : Trip To ' + trip.to_place
        message_body = 'The Trip is from ' + trip.from_place + ' to ' + trip.to_place + ' on ' + trip.date.strftime("%Y-%m-%d %H:%M")
        try:
            push_service.notify_single_device(registration_id=device_id, message_title=message_title, message_body=message_body)
        except:
            print('Sending ERROR')
        try:
            notify = Notification(message=message_body,title=message_title,type=0)
            notify.save()
            notify.users.set(BaseUser.objects.filter(device_id__in=list(device_ids)))
            notify.save()
        except:
            print('Notification object Create ERROR')
        return Response(serializer.data)
