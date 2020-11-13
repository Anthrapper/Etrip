from django.conf import settings
from django.contrib.auth import get_user_model

from rest_framework import status
from rest_framework.decorators import action
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.response import Response
from rest_framework.viewsets import GenericViewSet
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import AllowAny

from requests.exceptions import HTTPError
from .serializers import UserSerializer, UserCreateSerializer
from firebase_admin import auth as admin_auth
import firebase_admin
import pyrebase

config = {
  "apiKey": settings.FIREBASE_APIKEY,
  "authDomain": settings.FIREBASE_AUTHDOMAIN,
  "databaseURL": settings.FIREBASE_DATABASEURL,
  "storageBucket": settings.FIREBASE_STORAGEBUCKET
}


#x = auth.get_user_by_phone_number('+917012595875')
firebase = pyrebase.initialize_app(config)
default_app = firebase_admin.initialize_app()
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
        # We create a token than will be used for future auth
        user=serializer.instance
        print(serializer.data)
        try:
            firebase_user = auth.create_user_with_email_and_password(user.email,user.password)
            m = auth.send_email_verification(firebase_user['idToken'])
        except:
            print('Account Found')
            try:
                firebase_user = admin_auth.get_user_by_email(user.username)
                m = auth.send_email_verification(firebase_user['idToken'])
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
