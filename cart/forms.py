from django import forms

class AddToCartForm(forms.Form):

    x = [(i,str(i)) for i in range(1,10)]
    quantity = forms.TypedChoiceField(choices=x, coerce=int)

    inplace = forms.BooleanField(required=False , widget=forms.HiddenInput)
