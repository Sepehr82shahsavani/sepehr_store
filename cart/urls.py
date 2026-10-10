from django.urls import path
from . import views

app_name = "cart"
urlpatterns = [
    path("", views.basket_detail, name="basket_detail"),
    path("add/<int:product_id>/", views.add_basket_view, name="basket_add"),
    path("increase/<int:product_id>/", views.increase_basket, name="basket_increase"),
    path("decrease/<int:product_id>/", views.decrease_basket, name="basket_decrease"),
    path("remove/<int:product_id>/", views.remove_from_basket, name="basket_remove"),
    path("clear/", views.clear_basket, name="basket_clear"),
]

