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
from rest_framework.parsers import MultiPartParser, FormParser
from django.contrib.auth.models import User
from rest_framework.generics import CreateAPIView ,UpdateAPIView
from .serializers import VehicleSerializer, DriverVehicleSerializer, DriverVehicleListSerializer
from e_trip.vehicles.models import Vehicle
from e_trip.users.models import Driver

class VehicleList(generics.ListAPIView):
    serializer_class = VehicleSerializer
    queryset = Vehicle.objects.all()

class CreateDriverVehicle(CreateAPIView):
    serializer_class = DriverVehicleSerializer
    parser_classes = (MultiPartParser, FormParser)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        # We create a token than will be used for future auth
        print('created vehicle')
        create_message = {"message": "created vehicle"}
        return Response(
            {**serializer.data, **create_message},
            status=status.HTTP_201_CREATED,
            headers=headers
        )

class DriverVehicleList(generics.ListAPIView):
    serializer_class = DriverVehicleListSerializer
    queryset = Vehicle.objects.all()

    def get_queryset(self):
        user = self.request.user
        driver = get_object_or_404(Driver, user=user)
        return Vehicle.objects.filter(id__in = driver.vehicles.all())
