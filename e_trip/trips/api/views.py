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
from .serializers import UserTripCreateSerializer, UserTripListSerializer
from e_trip.trips.models import Trip

class CreateTripUser(CreateAPIView):
    serializer_class = UserTripCreateSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        create_message = {"message": "Trip Created"}
        return Response(
            {**serializer.data, **create_message},
            status=status.HTTP_201_CREATED,
            headers=headers
        )


class UserTripList(generics.ListAPIView):
    serializer_class = UserTripListSerializer
    queryset =Trip.objects.all()

    def get_queryset(self):
        user = self.request.user
        return Trip.objects.filter(user=user).filter(trip_status = 0)
