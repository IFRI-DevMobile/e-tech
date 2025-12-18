import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CategoryController extends GetxController {
  final categories = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Ici, vous pouvez charger les catégories depuis votre API ou votre base de données
    loadCategories();
  }

  void loadCategories() {
    // Exemple de données statiques - à remplacer par un appel API
    categories.value = [
      {'id': 1, 'name': 'Électronique', 'icon': Icons.electrical_services},
      {'id': 2, 'name': 'Vêtements', 'icon': Icons.shopping_bag},
      {'id': 3, 'name': 'Maison', 'icon': Icons.home},
      {'id': 4, 'name': 'Beauté', 'icon': Icons.face_retouching_natural},
      {'id': 5, 'name': 'Sports', 'icon': Icons.sports_soccer},
      {'id': 6, 'name': 'Autres', 'icon': Icons.more_horiz},
    ];
  }
}
