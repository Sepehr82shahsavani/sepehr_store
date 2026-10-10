from django.views.generic import TemplateView
from products.models import Product


class HomeView(TemplateView):
    template_name = 'home.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        context['phones'] = (Product.objects.filter(active=True, category='phone').select_related('phone_spec')[:6])
        context['laptops'] = (Product.objects.filter(active=True, category='laptop').select_related('laptop_spec')[:6])
        context['cameras'] = (Product.objects.filter(active=True, category='camera').select_related('camera_spec')[:6])

        return context


class AboutView(TemplateView):
    template_name = 'about.html'
