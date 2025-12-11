import 'package:code_initial/presentation/pages/search/search_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {

  final TextEditingController searchController = TextEditingController();
  final currentTabIndex = 0.obs;

  final RxList<SearchPageModel> searchResults = <SearchPageModel>[].obs;
  final RxList<String> trendingKeywords = <String>[].obs;
  final RxList<String> categories = <String>[].obs;
  final RxBool isSearching = false.obs;
  final RxBool hasSearched = false.obs;
  final RxString selectedCategory = ''.obs;
  final RxString searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadTrendingKeywords();
    loadCategories();

    searchController.addListener(() {
      searchText.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void loadTrendingKeywords() {
    trendingKeywords.value = [
      'Smartphone',
      'Laptop',
      'Écouteurs',
      'Smartwatch',
      'Tablette',
      'Gaming',
      'Camera',
      'Accessoires',
      'Audio',
      'TV',
    ];
  }

  void loadCategories() {
    categories.value = [
      'Tous',
      'Téléphones',
      'Ordinateurs',
      'Audio',
      'Photo',
      'Gaming',
      'TV & Video',
      'Accessoires',
    ];
  }

  // Rechercher des produits
  Future<void> searchProducts(String query) async {
    if (query.trim().isEmpty) {
      searchResults.clear();
      hasSearched.value = false;
      return;
    }

    try {
      isSearching.value = true;
      hasSearched.value = true;
      await Future.delayed(const Duration(seconds: 1));

      searchResults.value = [
        SearchPageModel(
          id: '1',
          nom: 'iPhone 15 Pro',
          prix: 1299.99,
          imageUrl: 'assets/images/iphone.jpg',
          categorie: 'Téléphones',
        ),
        SearchPageModel(
          id: '2',
          nom: 'Samsung Galaxy S24',
          prix: 999.99,
          imageUrl: 'assets/images/samsung.jpg',
          categorie: 'Téléphones',
        ),
        SearchPageModel(
          id: '3',
          nom: 'MacBook Pro M3',
          prix: 2499.99,
          imageUrl: 'assets/images/macbook.jpg',
          categorie: 'Ordinateurs',
        ),
      ];

      if (selectedCategory.value.isNotEmpty && selectedCategory.value != 'Tous') {
        searchResults.value = searchResults
            .where((p) => p.categorie == selectedCategory.value)
            .toList();
      }
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Impossible d\'effectuer la recherche',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    } finally {
      isSearching.value = false;
    }
  }

  void searchByKeyword(String keyword) {
    searchController.text = keyword;
    searchProducts(keyword);
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    if (searchController.text.isNotEmpty) {
      searchProducts(searchController.text);
    }
  }

  void clearSearch() {
    searchController.clear();
    searchText.value = '';
    searchResults.clear();
    hasSearched.value = false;
    selectedCategory.value = '';
  }

  void onTabSelected(int index) {
    currentTabIndex.value = index;
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

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}