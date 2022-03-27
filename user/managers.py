from django.contrib.auth.base_user import BaseUserManager
from django.core.mail import send_mail
from django.utils.translation import gettext_lazy as _


class SpecialistManager(BaseUserManager):
    """
    Custom user model manager where email is the unique identifiers
    for authentication instead of usernames.
    """

    def create_user(self, email, **extra_fields):
        """
        Create and save a User with the given email and password.
        """
        if not email:
            raise ValueError(_('The Email must be set'))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        password = self.make_random_password(15)
        send_mail("Регистрация нового специалиста",
                  "Логин: {username}\nПароль: {password}".format(username=user.username, password=password),
                  'admin@salutem.com',
                  [email])
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, **extra_fields):
        """
        Create and save a SuperUser with the given email and password.
        """
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError(_('Superuser must have is_staff=True.'))
        if extra_fields.get('is_superuser') is not True:
            raise ValueError(_('Superuser must have is_superuser=True.'))
        return self.create_user(email, **extra_fields)
