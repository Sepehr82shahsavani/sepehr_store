from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.shortcuts import get_object_or_404, redirect, render
from django.views.decorators.http import require_http_methods
from cart.cart import Cart
from .models import Order, OrderItem

#-------------------------------------------------------------------------

@login_required
@require_http_methods(["GET", "POST"])
def order_create(request):
    cart = Cart(request)
    items = list(cart)
    total_price = sum(item["total_price"] for item in items)

    context = {
        "items": items,
        "total_price": total_price,
        "first_name": request.user.first_name,
        "last_name": request.user.last_name,
        "address": "",
        "postal_code": "",
        "mobile": request.user.mobile,
    }

    if request.method == "POST":
        first_name = request.POST.get("first_name", "").strip()
        last_name = request.POST.get("last_name", "").strip()
        address = request.POST.get("address", "").strip()
        postal_code = request.POST.get("postal_code", "").strip()
        mobile = request.POST.get("mobile", "").strip()

        context.update(
            {   "first_name": first_name,
                "last_name": last_name,
                "address": address,
                "postal_code": postal_code,
                "mobile": mobile,})


        with transaction.atomic():
            order = Order.objects.create(
                user=request.user,
                first_name=first_name,
                last_name=last_name,
                mobile=mobile,
                address=address,
                postal_code=postal_code,
                total_price=total_price,
            )

            for item in items:
                product = item["product_obj"]
                quantity = item["quantity"]
                unit_price = product.price

                OrderItem.objects.create(order=order,product=product,quantity=quantity,price=unit_price,total_price=unit_price * quantity,)

        cart.clear()
        return redirect("orders:order_success", order_id=order.id)

    return render(request, "orders/order_create.html", context)


@login_required
def order_success(request, order_id):
    order = get_object_or_404(Order,id=order_id,user=request.user,)
    return render(request,"orders/order_success.html",{"order": order},)
