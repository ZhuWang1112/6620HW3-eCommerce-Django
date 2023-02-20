from django.contrib import messages
from django.contrib.auth import authenticate

# Create your views here.


from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login

from cartApp.models import Cart
from commentApp.models import Comment
from productApp.models import Product
from .models import UserProfile


def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = UserProfile.objects.filter(username=username, password=password).first()
        if user:
            # If the authentication is successful, store the user object in the session
            request.session['user'] = {
                'id': user.id,
                'username': user.username,
            }
            # context = {'user': user}
            return redirect('home')
        else:
            return render(request, 'login.html', {'error': 'Invalid login credentials'})
    else:
        return render(request, 'login.html')


def home_view(request):
    if request.method == 'POST':
        return render(request, 'login.html')
    else:
        products = Product.objects.all()
        return render(request, 'home.html', {'products': products})


def register_view(request):
    if request.method == 'POST':
        UserProfile.objects.create(username=request.POST['username'], password=request.POST['password'])
        return redirect('login')
    else:
        return render(request, 'register.html')


# @require_POST
def add_to_cart(request, product_id):
    # check login
    if 'user' not in request.session:
        messages.warning(request, f'Sorry, You need login first')
        return redirect('home')

    # get product
    product = Product.objects.get(id=product_id)

    # get or create current cart
    cart_item, created = Cart.objects.get_or_create(user_id=request.session['user']['id'], product_id=product_id)

    # get action
    action = request.POST.get('action')

    if action == 'add':

        if product.stock <= 0:
            messages.warning(request, f'Sorry, {product.name} is out of stock.')
            return redirect('cart')

        cart_item.quantity += 1
        cart_item.save()
        product.stock -= 1
        product.save()
        messages.success(request, f'{product.name} has been added to your cart.')
        return redirect('cart')

    elif action == 'remove':
        if cart_item.quantity == 0:
            cart_item.delete()
            messages.success(request, f'{product.name} has been deleted to your cart.')
        else:
            cart_item.quantity -= 1
            product.stock += 1
            product.save()
            cart_item.save()
            messages.success(request, f'{product.name} has been reduced to your cart.')
        return redirect('cart')

    elif action == 'delete':
        product.stock += cart_item.quantity
        product.save()
        cart_item.delete()
        messages.success(request, f'{product.name} has been deleted to your cart.')
        return redirect('cart')

    # out of stock
    if product.stock <= 0:
        messages.warning(request, f'Sorry, {product.name} is out of stock.')
        return redirect('home')

    cart_item.quantity += 1
    cart_item.save()
    product.stock -= 1
    product.save()
    messages.success(request, f'{product.name} has been added to your cart.')

    return redirect('home')


def cart(request):
    # check login
    if 'user' not in request.session:
        messages.warning(request, f'Sorry, You need login first!!!')
        return redirect('home')

    # get user's cart items
    user_id = request.session['user']['id']
    cart_items = Cart.objects.filter(user_id=user_id).select_related('product')

    # calculate total price for each cart item
    for item in cart_items:
        item.total_price = item.quantity * item.product.price

    # calculate cart total
    cart_total = sum(item.total_price for item in cart_items)

    context = {
        'cart_items': cart_items,
        'cart_total': cart_total,
    }

    return render(request, 'cart.html', context)


def detail(request, product_id):
    # get product
    product = Product.objects.get(id=product_id)
    comments = Comment.objects.filter(product_id=product_id)
    context = {
        'product': product,
        'comments': comments
    }

    return render(request, 'detail.html', context)


def add_comment(request, product_id):
    if 'user' not in request.session:
        messages.warning(request, f'Sorry, You need login first!!!')
        return redirect('detail', product_id=product_id)

    newComment = request.POST['content']
    Comment.objects.create(user_id=request.session['user']['id'], content=newComment, product_id=product_id)

    return redirect('detail', product_id=product_id)


def log_out(request):
    del request.session['user']
    return redirect('/')


def guest(request):
    if 'user' in request.session:
        del request.session['user']

    return redirect('home')
