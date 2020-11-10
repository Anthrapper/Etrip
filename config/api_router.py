from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from e_trip.users.api.views import UserViewSet
from rest_framework_simplejwt import views as jwt_views
from django.urls import path
if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()

router.register("users", UserViewSet)


urlpatterns = [
    path('token/', jwt_views.TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
    #path('user/password/token/', PasswordResetAPI.as_view()),
]

app_name = "api"
urlpatterns += router.urls
