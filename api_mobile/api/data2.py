import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'api.settings')
django.setup()

from store.models import Category

products_data = [
    { 'name': 'Ordinateurs'},
    { 'name': 'Téléphones'},
    { 'name': 'Tablettes'},
    { 'name': 'Accessoires'},
    { 'name': 'Gaming'},
    { 'name': 'Réseau'},
    { 'name': 'Stockage'},
    { 'name': 'Périphériques'}
]

# Insertion en masse
Category.objects.bulk_create([
    Category(**category) for category in products_data
])

print(f"{len(products_data)} catégories insérées avec succès !")