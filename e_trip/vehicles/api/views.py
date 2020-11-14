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

from .serializers import VehicleSerializer
from e_trip.vehicles.models import Vehicle

class VehicleList(generics.ListAPIView):
    serializer_class = VehicleSerializer
    queryset = Vehicle.objects.all()
