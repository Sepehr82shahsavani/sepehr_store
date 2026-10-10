from django.contrib import admin
from .models import Order, OrderItem

#------------------------------------------------
class OrderItemInline(admin.TabularInline):
    model = OrderItem
    extra = 0
    can_delete = False
    fields = ("product","quantity","price","total_price",)
    readonly_fields = ("product","quantity","price","total_price",)


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ( "id","user","mobile","total_price","is_paid","created_at",)
    list_filter = ("is_paid","created_at",)
    search_fields = ("id","mobile","user__username","user__first_name","user__last_name",)
    readonly_fields = ("created_at","total_price",)
    inlines = (OrderItemInline, )
