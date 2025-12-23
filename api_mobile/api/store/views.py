from django.shortcuts import render
from rest_framework import viewsets

from .serializers import ProductSerializer, CategorySerializer, UserSerializer
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Product, Category, User
# Create your views here.

#Produits 
@api_view(['GET'])
def get_products(request):
    products = Product.objects.all()
    serializer = ProductSerializer(products, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_product(request,id):
    product = Product.objects.get(id=id)
    serializer = ProductSerializer(product)
    return Response(serializer.data)

#Catégories
@api_view(['GET'])
def get_categories(request):
    categories = Category.objects.all()
    serializer = CategorySerializer(categories, many=True)
    return Response(serializer.data)


#Utilisateurs (vulnérable sans protectionn réelle à corriger plus tard)
@api_view(['POST'])
def create_user(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        print("User created:", serializer.data)
        return Response(serializer.data, status=201)
    return Response(serializer.errors, status=400)

@api_view(['POST'])
def login_user(request):
    email = request.data['email']
    password = request.data['password']
    try:
        user = User.objects.get(email=email, password=password)
        serializer = UserSerializer(user)
        return Response(serializer.data)    
    except User.DoesNotExist:
        return Response({'error': 'Invalid credentials'}, status=400)
    
@api_view(['PUT'])
def edit_user(request):
    user_id = request.data['id']
    try:
        user = User.objects.get(id=user_id)
        serializer = UserSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            print("User updated:", serializer.data)
            return Response(serializer.data)
        return Response(serializer.errors, status=400)
    except User.DoesNotExist:
        print("User not found with id:", user_id)
        return Response({'error': 'User not found'}, status=404)
    
@api_view(['GET'])
def get_user(request):
    user_email = request.query_params.get('email')
    try:
        user = User.objects.get(email=user_email)
        serializer = UserSerializer(user)
        print("Fetched user:", serializer.data)
        return Response(serializer.data)
    except User.DoesNotExist:
        print("User not found with email:", user_email)
        return Response({'error': 'User not found'}, status=404)