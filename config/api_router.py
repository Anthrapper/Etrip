from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from e_trip.users.api.views import UserViewSet
from rest_framework_simplejwt import views as jwt_views
from django.urls import path

from e_trip.users.api.views import CreateUserAPIView,token_obtain_pair,CreateDriverUser,DriverUpdate
from e_trip.vehicles.api.views import VehicleList, DriverVehicleList
from e_trip.vehicles.api.views import CreateDriverVehicle
from e_trip.trips.api.views import CreateTripUser,UserTripList
from e_trip.trips.api.views import CreateBidDriver

if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()

router.register("users", UserViewSet)


urlpatterns = [
    path('driver/vehicles',VehicleList.as_view()),
    path('driver/vehicles/listed',DriverVehicleList.as_view()),
    path('driver/vehicles/registration', CreateDriverVehicle.as_view()),
    path('driver/registration/basic', CreateDriverUser.as_view()),
    path('driver/registration/docs',DriverUpdate.as_view()),
    path('driver/bids/create',CreateBidDriver.as_view()),
    path('user/registration', CreateUserAPIView.as_view()),
    path('user/trips/create', CreateTripUser.as_view()),
    path('user/trips/list', UserTripList.as_view()),
    path('token/', token_obtain_pair, name='token_obtain_pair'),
    path('token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    #path('user/password/token/', PasswordResetAPI.as_view()),
]

app_name = "api"
urlpatterns += router.urls
