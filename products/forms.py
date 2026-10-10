from django import forms
from .models import ProductComment
from django.utils.translation import gettext_lazy as _

#--------------------------------------------

class CommentForm(forms.ModelForm):
    class Meta:
        model = ProductComment
        fields = ['email', 'user_name', 'text', 'rating']

        labels = {
            'email': _('ایمیل'),
            'user_name': _('نام کاربر'),
            'text': _('متن نظر'),
            'rating': _('امتیاز'),
        }

        help_texts = {
            'rating': _('عدد بین ۱ تا ۵ وارد کنید'),
        }

        error_messages = {
            'email': {
                'required': _('لطفاً ایمیل خود را وارد کنید'),
                'invalid': _('ایمیل معتبر وارد کنید'),
            },
            'user_name': {
                'required': _('لطفاً نام خود را وارد کنید'),
            },
            'text': {
                'required': _('نوشتن متن نظر اجباری است'),
            },
            'rating': {
                'required': _('امتیاز را وارد کنید'),
                'invalid': _('عدد معتبر وارد کنید'),
                'max_value': _('امتیاز نمی‌تواند بیشتر از ۵ باشد'),
                'min_value': _('امتیاز نمی‌تواند کمتر از ۱ باشد'),
            },
        }


    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.fields['email'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': _('ایمیل خود را وارد کنید')
        })
        self.fields['user_name'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': _('نام خود را وارد کنید')
        })
        self.fields['text'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': _('نظر خود را بنویسید')
        })
        self.fields['rating'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': _('عدد بین ۱ تا ۵')
        })