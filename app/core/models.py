"""
Database models
"""

from django.db import models
from django.contrib.auth.models import (
    AbstractUser,  # Provides functionality for the authentication system.
    BaseUserManager,  # A base user manager class provided by Django.
    PermissionsMixin  # Provides functionality for the permissions and fields system.
)


class UserManager(BaseUserManager):
    """Manager for users."""

    def create_user(self, email, password=None, **extra_fields):
        """Create, save, and return user."""
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)

        return user


class User(AbstractUser, PermissionsMixin):
    """User model"""
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'email'  # Defines field for authentication. Defaults is user_id.
