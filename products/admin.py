from django.contrib import admin
from .models import Product,PhoneSpec,LaptopSpec,CameraSpec,ProductComment

class PhoneSpecInline(admin.StackedInline):
    model=PhoneSpec
    can_delete=False
    verbose_name_plural='مشخصات گوشی موبایل'

class LaptopSpecInline(admin.StackedInline):
    model=LaptopSpec
    can_delete=False
    verbose_name_plural='مشخصات لپ‌تاپ'

class CameraSpecInline(admin.StackedInline):
    model=CameraSpec
    can_delete=False
    verbose_name_plural='مشخصات دوربین عکاسی'

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = (
        'title',
        'price',
        'category',
        'active',
        'date_created',)
    list_filter = ('category', 'active')
    search_fields = ('title',)

    fields = (
        'title',
        'description',
        'price',
        'active',
        'category',
        'image_big',
        'image_small',
    )

    def get_inlines(self, request, obj=None):
        inlines = []

        if obj:
            if obj.category == 'phone':
                inlines.append(PhoneSpecInline)
            elif obj.category == 'laptop':
                inlines.append(LaptopSpecInline)
            elif obj.category == 'camera':
                inlines.append(CameraSpecInline)
        else:
            inlines = [
                PhoneSpecInline,
                LaptopSpecInline,
                CameraSpecInline,
            ]

        return inlines

@admin.register(ProductComment)
class ProductCommentAdmin(admin.ModelAdmin):
    list_display=('id','user_name','product','rating','is_approved','created_at','updated_at')
    list_display_links=('id','user_name')
    list_filter=('is_approved','rating','created_at','updated_at')
    search_fields=('user_name__username','user_name__email','email','product__title','text')
    list_editable=('is_approved','rating')
    readonly_fields=('created_at','updated_at')
    ordering=('-created_at',)
    date_hierarchy='created_at'
    fieldsets=(
        ('اطلاعات اصلی دیدگاه',{
            'fields':('product','user_name','email','text')
        }),
        ('امتیاز و وضعیت تأیید',{
            'fields':('rating','is_approved')
        }),
        ('تاریخ‌ها',{
            'fields':('created_at','updated_at')
        }),
    )


