from django.contrib.auth.forms import UserCreationForm ,UserChangeForm
from django.contrib.auth import get_user_model
from allauth.account.forms import SignupForm


class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = get_user_model()
        fields = ('username', 'email',)

class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = get_user_model()
        fields = ('username', 'email',)


class CustomSignupForm(SignupForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        if "username" in self.fields:
            self.fields["username"].label = "نام کاربری"
            self.fields["username"].widget.attrs.update({
                "class": "form-control",
                "placeholder": "نام کاربری"
            })

        if "email" in self.fields:
            self.fields["email"].label = "ایمیل"
            self.fields["email"].widget.attrs.update({
                "class": "form-control",
                "placeholder": "ایمیل"
            })

        if "password1" in self.fields:
            self.fields["password1"].label = "گذرواژه"
            self.fields["password1"].widget.attrs.update({
                "class": "form-control",
                "placeholder": "گذرواژه"
            })

        if "password2" in self.fields:
            self.fields["password2"].label = "تکرار گذرواژه"
            self.fields["password2"].widget.attrs.update({
                "class": "form-control",
                "placeholder": "تکرار گذرواژه"
            })
