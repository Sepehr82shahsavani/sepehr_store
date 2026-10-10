
from django.db import models
from django.urls import reverse
from django.contrib.auth import get_user_model
from PIL import Image

# ----------------------------------------------------------------------------


class Product(models.Model):
    CATEGORY_CHOICES = [
        ('phone', 'گوشی موبایل'),
        ('laptop', 'لپ‌تاپ'),
        ('camera', 'دوربین عکاسی'),
    ]

    title = models.CharField(max_length=100)
    description = models.TextField()
    price = models.PositiveIntegerField(default=0)
    active = models.BooleanField(default=True)
    category = models.CharField(max_length=10, choices=CATEGORY_CHOICES, default='phone')
    image_big = models.ImageField(upload_to='products/pic/big/')
    image_small = models.ImageField(upload_to='products/pic/small/',blank=True,null=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        if self.image_big and not self.image_small:
            img = Image.open(self.image_big.path)
            if img.height > 300 or img.width > 300:
                output_size = (300, 300)
                img.thumbnail(output_size)
                import os
                filename = os.path.basename(self.image_big.name)
                thumb_dir = os.path.join('media', 'products', 'pic', 'small')
                if not os.path.exists(thumb_dir):
                    os.makedirs(thumb_dir)
                thumb_path = os.path.join(thumb_dir, filename)
                img.save(thumb_path)
                self.image_small = os.path.join('products', 'pic', 'small', filename)
                super().save(update_fields=['image_small'])

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('products:product_detail', args=[self.id])


class PhoneSpec(models.Model):
    product = models.OneToOneField(Product, on_delete=models.CASCADE, related_name='phone_spec')
    screen_size = models.CharField(max_length=50, verbose_name="اندازه صفحه نمایش")
    camera_resolution = models.CharField(max_length=50, verbose_name="رزولوشن دوربین")
    battery_capacity = models.CharField(max_length=50, verbose_name="ظرفیت باتری")
    storage = models.CharField(max_length=50, verbose_name="حافظه داخلی")

    def __str__(self):
        return f"مشخصات موبایل: {self.product.title}"


class LaptopSpec(models.Model):
    product = models.OneToOneField(Product, on_delete=models.CASCADE, related_name='laptop_spec')
    cpu = models.CharField(max_length=100, verbose_name="پردازنده (CPU)")
    ram = models.CharField(max_length=50, verbose_name="حافظه رم (RAM)")
    gpu = models.CharField(max_length=100, verbose_name="کارت گرافیک (GPU)")
    storage = models.CharField(max_length=100, verbose_name="حافظه داخلی")

    def __str__(self):
        return f"مشخصات لپ‌تاپ: {self.product.title}"


class CameraSpec(models.Model):
    product = models.OneToOneField(Product, on_delete=models.CASCADE, related_name='camera_spec')
    sensor_type = models.CharField(max_length=100, verbose_name="نوع حسگر")
    resolution = models.CharField(max_length=50, verbose_name="رزولوشن")
    lens_mount = models.CharField(max_length=100, verbose_name=" لنز")
    video_resolution = models.CharField(max_length=100, verbose_name="کیفیت ")

    def __str__(self):
        return f"مشخصات دوربین: {self.product.title}"

class ProductComment(models.Model):
    product = models.ForeignKey(Product,on_delete=models.CASCADE,related_name='comments')
    user_name = models.ForeignKey(get_user_model(),on_delete=models.CASCADE,related_name='comments')
    email = models.EmailField(blank=True, null=True)
    text = models.TextField()
    rating = models.PositiveSmallIntegerField(default=5)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_approved = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.user_name} - {self.product.title}"
