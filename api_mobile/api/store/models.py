from django.db import models

# Create your models here.
# Les classes des différentes tables en base de données.

class Product(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    stock = models.IntegerField()
    image_url = models.URLField(blank=True, null=True)
    category = models.ForeignKey('Category', on_delete=models.DO_NOTHING, related_name='products', blank="true")

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
    
class User(models.Model):
    name = models.CharField(max_length=255)
    email = models.EmailField()
    password = models.CharField(max_length=100)

    def __str__(self):
        return self.name