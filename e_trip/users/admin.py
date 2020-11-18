from django.contrib import admin
from django.contrib.auth import admin as auth_admin
from django.contrib.auth import get_user_model

from e_trip.users.forms import UserChangeForm, UserCreationForm
from .models import Driver
User = get_user_model()


@admin.register(User)
class UserAdmin(auth_admin.UserAdmin):

    form = UserChangeForm
    add_form = UserCreationForm
    fieldsets = (("User", {"fields": ("name","phone","user_type","device_id")}),) + tuple(
        auth_admin.UserAdmin.fieldsets
    )
    list_display = ["username", "name", "is_superuser"]
    search_fields = ["name"]

admin.site.register(Driver)

admin.site.site_header = "ETrip Admin"
admin.site.site_title = "ETrip Dashboard"
admin.site.index_title = "Welcome to ETrip Dashboard"
