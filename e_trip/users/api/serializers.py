from django.contrib.auth import get_user_model
from rest_framework import serializers
import django.contrib.auth.password_validation as validators
from django.core import exceptions

from e_trip.users.models import Driver

import re
from django.conf import settings

regex = settings.PHONE_EMAIL_REGEX
regex_contact = settings.PHONE_REGEX
regex_mail = settings.EMAIL_REGEX

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "email", "name", "url"]

        extra_kwargs = {
            "url": {"view_name": "api:user-detail", "lookup_field": "username"}
        }

class UserCreateSerializer(serializers.ModelSerializer):
    username = serializers.CharField()
    password = serializers.CharField(write_only=True,
                                     style={'input_type': 'password'})
    name = serializers.CharField()

    def validate(self, data):
        username = data['username']
        name = data['name']
        password = data.get('password')
        phone_email_match = re.match(regex,username)
        if not phone_email_match:
            raise serializers.ValidationError("Invalid Username")
        errors = dict()
        try:
            validators.validate_password(password=password, user=User)
        except exceptions.ValidationError as e:
            errors['password'] = list(e.messages)
        if User.objects.filter(username=username).exists():
            raise serializers.ValidationError("Username already taken")
        if User.objects.filter(email=username).exists():
            raise serializers.ValidationError("email already taken")
        if User.objects.filter(phone=username).exists():
            raise serializers.ValidationError("phone already taken")
        if errors:
            raise serializers.ValidationError(errors)
        return data

    class Meta:
        model = User
        fields = ["username", "name", "password"]
        write_only_fields = ('password')
        read_only_fields = ('is_staff', 'is_superuser', 'is_active',)

    def create(self, validated_data):
        print(validated_data)
        phone_match = re.match(regex_contact, validated_data['username'])
        email_match = re.match(regex_mail, validated_data['username'])
        if phone_match:
            validated_data['phone'] = validated_data['username']
        if email_match:
            validated_data['email'] = validated_data['username']
        user = super(UserCreateSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.is_active = True
        user.user_type = 0
        user.save()
        return user

class DriverUserCreateSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True,
                                     style={'input_type': 'password'})
    name = serializers.CharField()

    def validate(self, data):
        username = data['phone']
        email = data['email']
        name = data['name']
        password = data.get('password')
        phone_match = re.match(regex_contact,username)
        email_match = re.match(regex_mail,email)
        if not phone_match:
            raise serializers.ValidationError("Invalid Phone")
        if not email_match:
            raise serializers.ValidationError("Invalid Email")
        errors = dict()
        try:
            validators.validate_password(password=password, user=User)
        except exceptions.ValidationError as e:
            errors['password'] = list(e.messages)
        if User.objects.filter(username=username).exists():
            raise serializers.ValidationError("phone already taken")
        if User.objects.filter(email=email).exists():
            raise serializers.ValidationError("email already taken")
        if User.objects.filter(phone=username).exists():
            raise serializers.ValidationError("phone already taken")
        if errors:
            raise serializers.ValidationError(errors)
        return data

    class Meta:
        model = User
        fields = ["phone","email", "name", "password"]
        write_only_fields = ('password')
        read_only_fields = ('is_staff', 'is_superuser', 'is_active',)

    def create(self, validated_data):
        print(validated_data)
        validated_data['username'] = validated_data['phone']
        user = super(DriverUserCreateSerializer, self).create(validated_data)
        user.set_password(validated_data['password'])
        user.is_active = True
        user.user_type = 0
        user.save()
        return user

class DriverUserUpdateSerializer(serializers.ModelSerializer):
    user = serializers.SerializerMethodField()
    class Meta:
        model = Driver
        fields = ["user","vehicles","photo","license_front","license_back"]
    def validate(self,data):
        data['user'] = self.context.get('request').user
        print(data)
        if not Driver.objects.filter(user=self.context.get('request').user).exists():
            raise serializers.ValidationError("No Driver User Found")
        else:
            data['user'] = self.context.get('request').user
        return data
    def get_user(self,obj):
        print(self.context.get('request').user)
        return self.context.get('request').user.id

class UserActivationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["email"]
