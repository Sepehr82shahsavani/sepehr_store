from products.models import Product


class Cart:
    def __init__(self, request):
        self.request = request
        self.session = request.session
        cart = self.session.get('cart')

        if not cart:
            cart = self.session['cart'] = {}
        self.cart = cart

    def add(self, product, quantity=1, replace_quantity=False):
        product_id = str(product.id)

        current_quantity = self.cart.get(product_id, {}).get("quantity", 0)

        if replace_quantity:
            new_quantity = quantity
        else:
            new_quantity = current_quantity + quantity

        if new_quantity <= 0:
            self.cart.pop(product_id, None)
        else:
            self.cart[product_id] = {"quantity": new_quantity}

        self.save()

    def remove(self, product):
        product_id = str(product.id)
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()

    def save(self):
        self.session.modified = True

    def __len__(self):
        return sum(item['quantity'] for item in self.cart.values())

    def __iter__(self):
        product_ids = self.cart.keys()
        products = Product.objects.filter(id__in=product_ids)

        cart = self.cart.copy()

        for product in products:
            cart[str(product.id)]['product_obj'] = product
            cart[str(product.id)]['total_price'] = product.price * cart[str(product.id)]['quantity']

        for item in cart.values():
            yield item

    def clear(self):
        del self.session['cart']
        self.save()

    def get_total_price(self):
        return sum(item['quantity'] * item['product_obj'].price for item in self)
