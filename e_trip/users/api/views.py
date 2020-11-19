from django.conf import settings
from django.contrib.auth import get_user_model
from django.shortcuts import get_list_or_404, get_object_or_404

from rest_framework import status
from rest_framework.decorators import action
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework.generics import CreateAPIView ,UpdateAPIView
from rest_framework.permissions import AllowAny
from rest_framework import generics
from rest_framework_simplejwt.authentication import AUTH_HEADER_TYPES
from rest_framework_simplejwt.exceptions import InvalidToken, TokenError
from rest_framework_simplejwt import serializers
from rest_framework.parsers import MultiPartParser, FormParser

from .serializers import UserSerializer, UserCreateSerializer, DriverUserCreateSerializer, DriverUserUpdateSerializer
from e_trip.users.models import Driver

from requests.exceptions import HTTPError
from firebase_admin import auth as admin_auth
from firebase_admin import credentials
import firebase_admin
import pyrebase
import re

config = {
  "apiKey": settings.FIREBASE_APIKEY,
  "authDomain": settings.FIREBASE_AUTHDOMAIN,
  "databaseURL": settings.FIREBASE_DATABASEURL,
  "storageBucket": settings.FIREBASE_STORAGEBUCKET
}

regex = settings.PHONE_EMAIL_REGEX
regex_contact = settings.PHONE_REGEX
regex_mail = settings.EMAIL_REGEX

if not firebase_admin._apps:
    cred = credentials.Certificate(settings.GOOGLE_APPLICATION_CREDENTIALS)
    default_app = firebase_admin.initialize_app(cred,config)

firebase = pyrebase.initialize_app(config)

auth = firebase.auth()

User = get_user_model()


class UserViewSet(RetrieveModelMixin, ListModelMixin, UpdateModelMixin, GenericViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all()
    lookup_field = "username"

    def get_queryset(self, *args, **kwargs):
        return self.queryset.filter(id=self.request.user.id)

    @action(detail=False, methods=["GET"])
    def me(self, request):
        serializer = UserSerializer(request.user, context={"request": request})
        return Response(status=status.HTTP_200_OK, data=serializer.data)

class CreateUserAPIView(CreateAPIView):
    serializer_class = UserCreateSerializer
    permission_classes = [AllowAny]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        user=serializer.instance
        print(serializer.data)
        email_match = re.match(regex_mail, user.username)
        if email_match:
            try:
                firebase_user = auth.create_user_with_email_and_password(user.email,user.password)
                auth.send_email_verification(firebase_user['idToken'])
            except:
                print('Account Found')
                try:
                    firebase_user = admin_auth.get_user_by_email(user.username)
                    admin_auth.delete_user(firebase_user.uid)
                    firebase_user = auth.create_user_with_email_and_password(user.email,user.password)
                    auth.send_email_verification(firebase_user['idToken'])
                except:
                    print('error2')
            content = {'message': 'mail has been send!'}


        print('send message')
        create_message = {"message": "Your account is created successfully."}
        return Response(
            {**serializer.data, **create_message},
            status=status.HTTP_201_CREATED,
            headers=headers
        )

class CreateDriverUser(CreateAPIView):
    serializer_class = DriverUserCreateSerializer
    permission_classes = [AllowAny]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        # We create a token than will be used for future auth
        user=serializer.instance
        print(serializer.data)
        email_match = re.match(regex_mail, user.username)
        if email_match:
            try:
                firebase_user = auth.create_user_with_email_and_password(user.email,user.password)
                auth.send_email_verification(firebase_user['idToken'])
            except:
                print('Account Found')
                try:
                    firebase_user = admin_auth.get_user_by_email(user.username)
                    admin_auth.delete_user(firebase_user.uid)
                    firebase_user = auth.create_user_with_email_and_password(user.email,user.password)
                    auth.send_email_verification(firebase_user['idToken'])
                except:
                    print('error2')
            content = {'message': 'mail has been send!'}

        obj,creatd = Driver.objects.get_or_create(user=user)
        print('send message')
        create_message = {"message": "Your account is created successfully."}
        return Response(
            {**serializer.data, **create_message},
            status=status.HTTP_201_CREATED,
            headers=headers
        )

class DriverUpdate(UpdateAPIView):
    serializer_class = DriverUserUpdateSerializer
    queryset = Driver.objects.all()
    parser_classes = (MultiPartParser, FormParser)

    def get_object(self):
        obj = Driver.objects.get(user=self.request.user)
        return obj
    def create(self, request, *args, **kwargs):
        print(request.data)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)

class TokenViewBase(generics.GenericAPIView):
    permission_classes = ()
    authentication_classes = ()

    serializer_class = None

    www_authenticate_realm = 'api'

    def get_authenticate_header(self, request):
        return '{0} realm="{1}"'.format(
            AUTH_HEADER_TYPES[0],
            self.www_authenticate_realm,
        )

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        username = request.data['username']
        phone_email_match = re.match(regex,username)
        phone_match = re.match(regex_contact, username)
        email_match = re.match(regex_mail, username)
        if phone_match:
            if User.objects.filter(phone=username).exclude(is_superuser=True).exists():
                user =  get_object_or_404(User,phone=username)
                request.data.update({"username":user.username})
        if email_match:
            if User.objects.filter(email=username).exclude(is_superuser=True).exists():
                user =  get_object_or_404(User,email=username)
                request.data.update({"username":user.username})
        print(request.data['username'])
        print(serializer)
        message = {}
        if User.objects.filter(username=username).exclude(is_superuser=True).exists():
            if phone_email_match:
                if phone_match:
                    try:
                        userdata = str('+91') + str(username)
                        firebase_user = admin_auth.get_user_by_phone_number(userdata)
                    except:
                        return Response({'user':'inactive or 404'}, status=status.HTTP_401_UNAUTHORIZED)
                if email_match:
                    try:
                        firebase_user = admin_auth.get_user_by_email(username)
                        if not firebase_user.email_verified:
                            return Response({'user':'inactive'}, status=status.HTTP_401_UNAUTHORIZED)
                    except:
                        return Response({'user':'404'}, status=status.HTTP_401_UNAUTHORIZED)
        try:
            serializer.is_valid(raise_exception=True)
            username = request.data['username']
            user =  get_object_or_404(User,username=username)
            if 'device_id' in request.data:
                device_id = request.data['device_id']
                user.device_id = device_id
                user.save()
            if Driver.objects.filter(user=user).exists():
                driver = get_object_or_404(Driver, user=user)
                message = {
                'user': 'driver',
                'is_document_cleared': driver.is_document_cleared,
                'status':driver.driver_status
                }
            elif user.is_superuser:

                message = {
                'user': 'admin'
                }
            else:
                message = {
                'user':'user'
                }

        except TokenError as e:
            raise InvalidToken(e.args[0])

        return Response({**serializer.validated_data,**message}, status=status.HTTP_200_OK)

class TokenObtainPairView(TokenViewBase):
    """
    Takes a set of user credentials and returns an access and refresh JSON web
    token pair to prove the authentication of those credentials.
    """
    serializer_class = serializers.TokenObtainPairSerializer


token_obtain_pair = TokenObtainPairView.as_view()
