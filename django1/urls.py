"""django1 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from django1.settings import DEBUG, MEDIA_ROOT
from userApp import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('home', views.HomeView.as_view(), name='home'),
    path('', views.login_view, name='login'),
    path('login', views.login_view, name='login'),
    path('checklogin',views.checkLogin_view, name='checkLogin'),
    path('register', views.register_view, name='register'),
    # path('guest', views.guest, name='guest'),
    path('cart/modify', views.ModifyProduct.as_view(), name='add_to_cart'),
    path('cart', views.cart, name='cart'),
    path('detail', views.detail, name='detail'),
    path('addComment', views.add_comment, name='add_comment'),
    path('deleteComment', views.delete_comment, name='deleteComment'),
    path('log_out', views.log_out, name='log_out'),
]

# if DEBUG:
#     from django.views.static import serve
#     urlpatterns.append(path('media/(.*)', serve, kwargs={'document_root': MEDIA_ROOT}))