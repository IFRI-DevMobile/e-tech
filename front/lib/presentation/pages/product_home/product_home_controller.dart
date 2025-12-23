import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/models/category_model.dart';
import '../../../../domain/models/product_model.dart';
import '../api_service/store_repository.dart';

class ProductHomeController extends GetxController {
  // États observables
  final currentTabIndex = 0.obs;
  final searchQuery = ''.obs;
  final isLoading = false.obs;
  final selectedTab = 'Recommandations'.obs;
  final repository = StoreRepository();

  // Listes observables
  final products = <Product>[].obs;
  final categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  // Données EXACTEMENT comme dans l'image
  void _loadInitialData() async {
    try {
      isLoading.value = true; // Activer un loader
      final response = await repository.getProducts();

      if (response.statusCode == 200) {
        // response.data est une List<dynamic>
        final List rawData = response.data;

        // On convertit la liste brute en liste d'objets Product
        final List<Product> loadedProducts =
            rawData.map((json) => Product.fromJson(json)).toList();

        products.assignAll(loadedProducts);
      }
    } catch (e) {
      Get.snackbar(
          "Erreur", "Impossible de charger les produits : $e.toString()",
          duration: const Duration(seconds: 60));
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      isLoading.value = true;
      final response = await repository.getCategories();
      
      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data;
        final List<Category> loadedCategories = [];
        
        // Créer une map pour regrouper les produits par catégorie
        final Map<int, List<Product>> productsByCategory = {};
        
        // Remplir la map avec les produits existants
        for (var product in products) {
          if (!productsByCategory.containsKey(product.categoryId)) {
            productsByCategory[product.categoryId] = [];
          }
          productsByCategory[product.categoryId]!.add(product);
        }
        
        // Créer les catégories avec leurs produits associés
        for (var categoryData in rawData) {
          final category = Category(
            id: categoryData['id'] ?? 0,
            name: categoryData['name'] ?? 'Sans nom',
            icon: categoryData['icon'],
            products: productsByCategory[categoryData['id']] ?? [],
          );
          loadedCategories.add(category);
        }
        
        categories.assignAll(loadedCategories);
      }
    } catch (e) {
      Get.snackbar(
        'Erreur', 
        'Impossible de charger les catégories : $e',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      // En cas d'erreur, charger des catégories par défaut
      _loadDefaultCategories();
    } finally {
      isLoading.value = false;
    }
  }
  
  void _loadDefaultCategories() {
    categories.assignAll([
      Category(id: 1, name: 'Ordinateurs', icon: 'computer'),
      Category(id: 2, name: 'Téléphones', icon: 'phone_iphone'),
      Category(id: 3, name: 'Tablettes', icon: 'tablet'),
      Category(id: 4, name: 'Accessoires', icon: 'headphones'),
      Category(id: 5, name: 'Gaming', icon: 'sports_esports'),
      Category(id: 6, name: 'Réseau', icon: 'router'),
      Category(id: 7, name: 'Stockage', icon: 'sd_storage'),
      Category(id: 8, name: 'Périphériques', icon: 'keyboard'),
    ]);
  }

  // Actions
  void selectTab(String tab) {
    selectedTab.value = tab;
  }

  void toggleFavorite(int productId) {
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      final product = products[index];
      products[index] = product.copyWith(isFavorite: !product.isFavorite);
      products.refresh();
    }
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  void onProductTap(int productId) {
    Get.toNamed('/product-detail', arguments: productId);
  }

  void onTabSelected(int index) {
    currentTabIndex.value = index;
  }

  void onGridPressed() {
    // Action pour le bouton grille
  }

  void addToCart(int productId) {
    Get.snackbar(
      'Ajouté au panier',
      'Produit ajouté avec succès',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }

  void onScanPressed() {
    Get.snackbar(
      'Scanner',
      'Scanner QR activé',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: const Color(0xFF3B5998),
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}

// Binding
class ProductHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductHomeController>(() => ProductHomeController());
  }
}
