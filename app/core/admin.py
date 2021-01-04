from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext as _

from core import models


class UserAdmin(BaseUserAdmin):
    ordering = ['id']
    list_display = ['email', 'name']
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Personal Info'), {'fields': ('name',)}),
        (
            _('Permissions'),
            {'fields': ('is_active', 'is_staff', 'is_superuser')}
        ),
        (_('Important Dates'), {'fields': ('last_login',)})
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
<<<<<<< HEAD
            'fields': ('email', 'password1', 'password2')
=======
            'fields': ('email', 'password1','password2')
>>>>>>> 3f08f16a72a32e311a4668c146bb1a2bddf8dd13
        }),
    )


admin.site.register(models.User, UserAdmin)
