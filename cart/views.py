from django.shortcuts import render, redirect, get_object_or_404, reverse
from products.models import Product
from .cart import Cart
from .forms import AddToCartForm
from django.views.decorators.http import require_POST


#--------------------------------------------------------------------------

def basket_detail(request):
    cart = Cart(request)
    return render(request, "basket_details.html", {"cart": cart})

@require_POST
def add_basket_view(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = AddToCartForm(request.POST or None)

    if form.is_valid():
        quantity = form.cleaned_data["quantity"]
        cart.add(product, quantity)
        return redirect("cart:basket_detail")

    return redirect(reverse('products:product_detail', kwargs={'pk': product.id}))

@require_POST
def remove_from_basket(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect("cart:basket_detail")

@require_POST
def clear_basket(request):
    Cart(request).clear()
    return redirect("cart:basket_detail")
@require_POST
def increase_basket(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)

    if request.method == "POST":
        cart.add(product, quantity=1)

    return redirect("cart:basket_detail")

@require_POST
def decrease_basket(request, product_id):
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)

    if request.method == "POST":
        cart.add(product, quantity=-1)

    return redirect("cart:basket_detail")
