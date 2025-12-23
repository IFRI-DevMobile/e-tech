import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_service/store_repository.dart';
import '../product_home/product_home_controller.dart';

class ProductDetailController extends GetxController {
  // Variables produit
  late int productId;
  RxBool isLoading = false.obs;
  RxInt quantity = 1.obs;
  RxBool isExpanded = false.obs;
  RxString selectedSize = 'L'.obs;
  RxString selectedColor = 'blue'.obs;
  var product;

  @override
  void onInit() {
    super.onInit();
    // Récupération de l'argument passé par Get.toNamed
    if (Get.arguments != null) {
      productId = Get.arguments as int;
      loadData(productId);
    } else {
      // Gérer l'erreur si aucun ID n'est fourni
      print("Erreur : Aucun ID de produit reçu");
    }
  }

  RxInt currentTabIndex = 0.obs;

  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  final Map<String, Color> colors = {
    'peach': const Color(0xFFFFB8A3),
    'blue': const Color(0xFF5B7FCD),
    'red': const Color(0xFFFF5757),
  };

  final StoreRepository repository = StoreRepository();
  final String productName = 'Smart Watch';
  final double rating = 5.0;
  final int reviewCount = 7932;
  final String oldPrice = '162.99';
  final String currentPrice = '160.00';
  final String shortDescription =
      'Sa forme simple et élégante la rend parfaite pour celles qui, comme vous, aiment les vêtements minimalistes';
  final String fullDescription =
      'Sa forme simple et élégante la rend parfaite pour celles qui, comme vous, aiment les vêtements minimalistes. Cette montre connectée combine style et technologie pour vous accompagner au quotidien avec élégance et performance.';

  void loadData(int id) async {
    try {
      isLoading.value = true;
      update(); // Notifie la vue qu'on commence à charger

      final response = await repository.getProduct(id);

      if (response.statusCode == 200) {
        // 2. On mappe les données
        product = Product.fromJson(response.data);
      }
    } catch (e) {
      print("Erreur chargement: $e");
      Get.snackbar('Erreur', 'Impossible de charger le produit');
    } finally {
      // 3. CRUCIAL : On arrête le chargement et on rafraîchit la vue
      isLoading.value = false;
      update();
    }
  }

  // Méthodes produit
  void incrementQuantity() {
    if (quantity.value < product.stock) quantity.value++;
    update();
  }

  void decrementQuantity() {
    if (quantity.value > 1) quantity.value--;
    update();
  }

  void toggleDescription() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  void selectSize(String size) {
    selectedSize.value = size;
    update();
  }

  void selectColor(String color) {
    selectedColor.value = color;
    update();
  }

  void addToCart() {
    print('Ajout au panier:');
    print('- Produit: ${product.name}');
    print('- Quantité: ${quantity.value}');
    print('- Taille: ${selectedSize.value}');
    print('- Couleur: ${selectedColor.value}');
  }

  // Méthodes menu bas
  void onScanPressed() {
    Get.snackbar(
      'Scan',
      'Fonctionnalité de scan',
      duration: const Duration(seconds: 1),
    );
  }

  void onTabSelected(int index) {
    currentTabIndex.value = index;

    switch (index) {
      case 0:
        break;
      case 1:
        Get.toNamed('/search');
        break;
      case 2:
        Get.toNamed('/cart');
        break;
      case 3:
        Get.toNamed('/profile');
        break;
    }
  }
}
