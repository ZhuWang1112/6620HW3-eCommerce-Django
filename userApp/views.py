from django.contrib import messages
from django.contrib.sessions.models import Session

# Create your views here.


from django.shortcuts import render, redirect
from django.utils import timezone
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.views import APIView

from cartApp.models import Cart
from cartApp.serializers import CartSerializer
from commentApp.models import Comment
from commentApp.serializers import CommentSerializer
from productApp.models import Product
from productApp.serializers import ProductSerializer
from .models import UserProfile


@api_view(['POST'])
def login_view(request):
    username = request.data.get('username')
    password = request.data.get('password')
    user = UserProfile.objects.filter(username=username, password=password).first()

    if user:
        # Create a session for the user
        request.session.create()
        expire_date = timezone.now() + timezone.timedelta(days=1)
        Session.objects.filter(pk=request.session.session_key).update(expire_date=expire_date)
        request.session['user'] = {
            'id': user.id,
            'username': user.username,
        }
        response = Response({'success': True, 'name': user.username}, status=status.HTTP_200_OK)
        return response
    else:
        response = Response({'success': False, 'error': 'Invalid login credentials'},
                            status=status.HTTP_401_UNAUTHORIZED)
        return response


@api_view(['GET'])
def cart(request):
    # check login
    if 'user' not in request.session:
        return Response({'success': False, 'error': 'Sorry, You need login first!!!'})

    # get user's cart items
    user_id = request.session['user']['id']
    cart_items = Cart.objects.filter(user_id=user_id).select_related('product')

    # calculate total price for each cart item
    for item in cart_items:
        item.total_price = item.quantity * item.product.price

    # calculate cart total
    cart_total = sum(item.total_price for item in cart_items)

    serializer = CartSerializer(cart_items, many=True)
    return Response({'success': True, 'cart_items': serializer.data, 'cart_total': cart_total})


class HomeView(APIView):
    def get(self, request):
        products = Product.objects.all()
        serializer = ProductSerializer(products, many=True)
        logged = 'user' in request.session
        data = {
            'success': True,
            'login': logged,
            'data': serializer.data
        }
        return Response(data, status=status.HTTP_200_OK)


class ModifyProduct(APIView):
    def _get_product_and_cart_item(self, request):
        # get product
        product_id = request.data.get("productId")
        product = Product.objects.get(id=product_id)

        # get or create current cart
        cart_item, created = Cart.objects.get_or_create(user_id=request.session['user']['id'], product_id=product_id)

        return product, cart_item

    def post(self, request):
        # check login
        if 'user' not in request.session:
            return Response({'success': False, 'error': 'Sorry, You need login first!!!'})

        product, cart_item = self._get_product_and_cart_item(request)

        if product.stock <= 0:
            return Response({'success': False, 'error': f'Sorry, {product.name} is out of stock.!!!'})

        cart_item.quantity += 1
        cart_item.save()
        product.stock -= 1
        product.save()
        return Response({'success': True, 'message': f'{product.name} has been added to your cart.'})

    def put(self, request):
        # check login
        if 'user' not in request.session:
            return Response({'success': False, 'error': 'Sorry, You need login first!!!'})

        product, cart_item = self._get_product_and_cart_item(request)

        if cart_item.quantity == 1:
            product.stock += 1
            product.save()
            cart_item.delete()
            return Response({'success': True, 'error': f'{product.name} has been deleted to your cart.'})
        else:
            cart_item.quantity -= 1
            product.stock += 1
            product.save()
            cart_item.save()
            message = str(f'{product.name} has been reduced to your cart.')
        return Response({'success': True, 'message': message})

    def delete(self, request):
        # check login
        if 'user' not in request.session:
            return Response({'success': False, 'error': 'Sorry, You need login first!!!'})

        product, cart_item = self._get_product_and_cart_item(request)

        product.stock += cart_item.quantity
        product.save()
        cart_item.delete()
        message = str(f'{product.name} has been deleted to your cart.')
        return Response({'success': True, 'message': message})


@api_view(['POST'])
def detail(request):
    # get product
    product_id = request.data.get('productId')
    print("product_id", product_id)
    product = Product.objects.get(id=product_id)
    productSerializer = ProductSerializer(product)
    commentsSerializer = CommentSerializer(Comment.objects.filter(product_id=product_id), many=True)

    data = {
        'success': True,
        'product': productSerializer.data,
        'comments': commentsSerializer.data
    }

    return Response(data, status=status.HTTP_200_OK)


@api_view(['POST'])
def add_comment(request):
    if 'user' not in request.session:
        return Response({'success': False, 'error': "Please log in !!"}, status=status.HTTP_401_UNAUTHORIZED)

    newComment = request.data.get('comment')
    print(newComment)
    product_id = request.data.get('productId')
    Comment.objects.create(user_id=request.session['user']['id'], content=newComment, product_id=product_id)

    return Response({'success': True, 'message': "Comment posted successfully"}, status=status.HTTP_200_OK)


@api_view(['GET'])
def log_out(request):
    del request.session['user']
    return Response({'success': True, 'message': 'log out!!'})


# def guest(request):
#     if 'user' in request.session:
#         del request.session['user']
#
#     return redirect('home')


@api_view(['POST'])
def register_view(request):
    if UserProfile.objects.filter(username=request.data.get('username')).exists():
        return Response({'success': False, 'error': 'This username has already been registered.'},
                        status=status.HTTP_409_CONFLICT)

    UserProfile.objects.create(username=request.data.get('username'), password=request.data.get('password'))
    return Response({'success': True, 'message': 'Register a new account!!'})


@api_view(['GET'])
def checkLogin_view(request):
    logged = 'user' in request.session
    if logged:
        return Response({'success': True, 'message': 'Hello!!'},
                        status=status.HTTP_200_OK)
    return Response({'success': False, 'message': 'Sorry, You need login first!!!'},
                    status=status.HTTP_401_UNAUTHORIZED)


@api_view(['POST'])
def delete_comment(request):
    comment_id = request.data.get('commentId')
    print(comment_id)
    Comment.objects.filter(id=comment_id).delete()
    return Response({'success': True, 'message': 'Comment has been deleted!!'},
                    status=status.HTTP_200_OK)
