from django.shortcuts import render, get_object_or_404, redirect
from .forms import CommentForm
from .models import *
from cart.forms import AddToCartForm

#----------------------------------------------------


from django.views import generic

from .models import Product


class ProductListView(generic.ListView):
    model = Product
    template_name = "products_list.html"
    context_object_name = "products"

    def get_queryset(self):
        queryset = Product.objects.filter(active=True)
        sort = self.request.GET.get("sort")

        if sort == "cheap":
            queryset = queryset.order_by("price")
        elif sort == "expensive":
            queryset = queryset.order_by("-price")

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = "همه محصولات"
        context["current_sort"] = self.request.GET.get("sort")
        return context


class PhoneListView(generic.ListView):
    model = Product
    template_name = "products_list.html"
    context_object_name = "products"

    def get_queryset(self):
        queryset = Product.objects.filter(active=True,category="phone")
        sort = self.request.GET.get("sort")
        if sort == "cheap":
            queryset = queryset.order_by("price")
        elif sort == "expensive":
            queryset = queryset.order_by("-price")

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = "گوشی‌های موبایل"
        context["current_sort"] = self.request.GET.get("sort")
        return context


class LaptopListView(generic.ListView):
    model = Product
    template_name = "products_list.html"
    context_object_name = "products"

    def get_queryset(self):
        queryset = Product.objects.filter(active=True,category="laptop")
        sort = self.request.GET.get("sort")
        if sort == "cheap":
            queryset = queryset.order_by("price")
        elif sort == "expensive":
            queryset = queryset.order_by("-price")

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = "لپ‌تاپ‌ها"
        context["current_sort"] = self.request.GET.get("sort")
        return context


class CameraListView(generic.ListView):
    model = Product
    template_name = "products_list.html"
    context_object_name = "products"

    def get_queryset(self):
        queryset = Product.objects.filter(active=True,category="camera")
        sort = self.request.GET.get("sort")
        if sort == "cheap":
            queryset = queryset.order_by("price")
        elif sort == "expensive":
            queryset = queryset.order_by("-price")

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["page_title"] = "دوربین‌های عکاسی"
        context["current_sort"] = self.request.GET.get("sort")
        return context


class ProductDetailView(generic.DetailView):
    model = Product
    template_name = "products_detail.html"
    context_object_name = "product"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["comment_form"] = CommentForm()
        context["cart_form"] = AddToCartForm()
        return context


class CommentCreateView(generic.CreateView):
    model = ProductComment
    form_class = CommentForm

    def form_valid(self, form):
        comment = form.save(commit=False)

        comment.user = self.request.user
        product_id = self.kwargs['product_id']
        comment.product = get_object_or_404 (Product, pk=product_id)

        comment.save()
        return redirect(self.get_success_url())

    def get_success_url(self):
        return reverse('products:product_detail', kwargs={'pk': self.kwargs['product_id']})
