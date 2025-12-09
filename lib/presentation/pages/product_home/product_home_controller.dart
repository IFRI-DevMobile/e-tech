import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductHomeController extends GetxController {
  // États observables
  final currentTabIndex = 0.obs;
  final searchQuery = ''.obs;
  final isLoading = false.obs;
  final selectedTab = 'Recommandations'.obs;
  
  // Listes observables
  final products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialData();
  }

  void _loadInitialData() {
    // Données avec images LOCALES
    products.assignAll([
      /*Product(
        id: 1, 
        name: 'Apple Watch', 
        price: 180.0,
        isFavorite: false,
        isNew: false,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id: 2, 
        name: 'Apple Watch', 
        price: 180.0,
        isFavorite: false,
        isNew: false,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),*/
      Product(
        id: 1, 
        name: 'Boogly chair', 
        price: 180.0,
        isFavorite: false,
        isNew: true,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id:2, 
        name: 'Boogly chair', 
        price: 180.0,
        isFavorite: false,
        isNew: true,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id: 1, 
        name: 'Boogly chair', 
        price: 180.0,
        isFavorite: false,
        isNew: true,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id:2, 
        name: 'Boogly chair', 
        price: 180.0,
        isFavorite: false,
        isNew: true,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id: 1, 
        name: 'Boogly chair', 
        price: 180.0,
        isFavorite: false,
        isNew: true,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id:2, 
        name: 'Boogly chair', 
        price: 180.0,
        isFavorite: false,
        isNew: true,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      /*Product(
        id: 5, 
        name: 'Apple Watch', 
        price: 180.0,
        isFavorite: false,
        isNew: false,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),
      Product(
        id: 6, 
        name: 'Apple Watch', 
        price: 180.0,
        isFavorite: false,
        isNew: false,
        imagePath: 'assets/images/Products/produit_montre.jpg',
      ),*/
    ]);
  }

  // Actions
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

  void selectTab(String tab) {
    selectedTab.value = tab;
  }
}

// Modèle Product
class Product {
  final int id;
  final String name;
  final double price;
  final bool isFavorite;
  final bool isNew;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.isFavorite,
    this.isNew = false,
    required this.imagePath,
  });

  Product copyWith({
    int? id,
    String? name,
    double? price,
    bool? isFavorite,
    bool? isNew,
    String? imagePath,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      isNew: isNew ?? this.isNew,
      imagePath: imagePath ?? this.imagePath,
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