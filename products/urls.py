from django.urls import path
from .views import *


app_name = 'products'

urlpatterns = [
    path('', ProductListView.as_view(), name='product-list'),

    path('phones/', PhoneListView.as_view(), name='phone_list'),
    path('laptops/', LaptopListView.as_view(), name='laptop_list'),
    path('cameras/', CameraListView.as_view(), name='camera_list'),

    path('<int:pk>/', ProductDetailView.as_view(), name='product_detail'),
    path('products/comment/<int:product_id>/', CommentCreateView.as_view(), name='comment_create'),
]
