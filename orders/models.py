from django.conf import settings
from django.db import models

from products.models import Product


class Order(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL,on_delete=models.CASCADE,related_name="orders",)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    mobile = models.CharField(max_length=20)
    address = models.TextField()
    postal_code = models.CharField(max_length=10)
    total_price = models.PositiveIntegerField(default=0)
    is_paid = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Order #{self.id} - {self.user}"

    class Meta:
        ordering = ["-created_at"]


class OrderItem(models.Model):
    order = models.ForeignKey(Order,on_delete=models.CASCADE,related_name="items",)
    product = models.ForeignKey(Product,on_delete=models.PROTECT,related_name="order_items",)
    quantity = models.PositiveIntegerField(default=1)
    price = models.PositiveIntegerField()
    total_price = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.product.title} - Order #{self.order.id}"
