import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/models/category_model.dart';

import 'product_home_controller.dart';

class ProductHomePage extends GetView<ProductHomeController> {
  const ProductHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildSearchBar(),
                      const SizedBox(height: 24),
                      _buildTabs(),
                      const SizedBox(height: 20),
                      Obx(
                        () => controller.selectedTab.value == 'Recommandations'
                            ? _buildProductsGrid()
                            : _buildCategoriesGrid(),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Trouvez l\'appareil qui\nvous convient',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.3,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2C4A9E),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/Products/Pro.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.person,
                      color: Colors.white, size: 24);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF5B7FCD), width: 1.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              onChanged: controller.onSearchChanged,
              decoration: const InputDecoration(
                hintText: 'Search Product',
                hintStyle: TextStyle(
                  color: Color(0xFF5B7FCD),
                  fontSize: 15,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF5B7FCD),
                  size: 22,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF5B7FCD), width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon:
                const Icon(Icons.grid_view, color: Color(0xFF5B7FCD), size: 22),
            onPressed: controller.onGridPressed,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Obx(() => Row(
          children: [
            _buildTab('Recommandations'),
            const SizedBox(width: 24),
            _buildTab('Catégories'),
          ],
        ));
  }

  Widget _buildTab(String title) {
    final isSelected = controller.selectedTab.value == title;
    return GestureDetector(
      onTap: () => controller.selectTab(title),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color:
                  isSelected ? const Color(0xFF3655B3) : Colors.grey.shade700,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 2,
              width: title == 'Recommandations' ? 120 : 80,
              decoration: BoxDecoration(
                color: const Color(0xFF3655B3),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.categories.isEmpty) {
        return const Center(
          child: Text('Aucune catégorie disponible'),
        );
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return _buildCategoryCard(category);
        },
      );
    });
  }

  Widget _buildCategoryCard(Category category) {
    // Définir une map pour mapper les noms d'icônes aux icônes Flutter
    final iconMap = <String, IconData>{
      'computer': Icons.computer,
      'phone_iphone': Icons.phone_iphone,
      'tablet': Icons.tablet,
      'headphones': Icons.headphones,
      'sports_esports': Icons.sports_esports,
      'router': Icons.router,
      'sd_storage': Icons.sd_storage,
      'keyboard': Icons.keyboard,
    };

    // Obtenir l'icône correspondante ou une icône par défaut
    final icon = category.icon != null && iconMap.containsKey(category.icon)
        ? iconMap[category.icon]!
        : Icons.category;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Action lors du clic sur une catégorie
          Get.snackbar(
            category.name,
            '${category.products?.length ?? 0} produits disponibles',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFF3655B3),
            colorText: Colors.white,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF5B7FCD), Color(0xFF3655B3)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                category.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsGrid() {
    return Obx(() {
      if (controller.selectedTab.value == 'Catégories') {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            return _buildCategoryCard(category);
          },
        );
      } else {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.72,
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return _buildProductCard(product);
          },
        );
      }
    });
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () => controller.onProductTap(product.id),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // SECTION IMAGE (partie haute - fond gris clair)
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    // Image du produit centrée
                    Center(
                      child: product.image_url.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                // Utilise network pour les API
                                product.image_url,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                // Gestion pendant que l'image télécharge
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2));
                                },
                                // Gestion si l'URL est invalide ou l'image inexistante
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  );
                                },
                              ),
                            )
                          : const Icon(Icons.inventory,
                              size: 40, color: Colors.grey),
                    ),
                    // Bouton favori (cœur)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () => controller.toggleFavorite(product.id),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.95),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.isFavorite
                                ? Colors.red
                                : Colors.grey.shade500,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // SECTION NOIRE EN BAS (contient TOUT : New, nom, prix, bouton)
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 19, 80, 211),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Colonne gauche : New + nom + prix
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Badge "New"
                        if (product.isNew)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 7, 11, 19),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Text(
                              'New',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        if (product.isNew) const SizedBox(height: 6),

                        // Nom du produit
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),

                        // Prix
                        Text(
                          '\$${product.price.toStringAsFixed(1)}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Bouton panier (à droite)
                  GestureDetector(
                    onTap: () => controller.addToCart(product.id),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF5B7FCD),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B7FCD).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Color.fromARGB(26, 0, 0, 255),
        shape: const CircleBorder(),
        child: InkWell(
          onTap: controller.onScanPressed,
          customBorder: const CircleBorder(),
          child: const Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.white,
          elevation: 8,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, 'Home', 0),
                _buildNavItem(Icons.search, 'Search', 1),
                const SizedBox(width: 40),
                _buildNavItem(Icons.shopping_cart, 'Cart', 2),
                _buildNavItem(Icons.person, 'Profile', 3),
              ],
            ),
          ),
        ));
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = controller.currentTabIndex.value == index;
    return InkWell(
      onTap: () {
        controller.onTabSelected(index);
        String? route = _getRouteForIndex(index);
        if (route != null) {
          Get.toNamed(route);
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  isSelected ? const Color(0xFF5B7FCD) : Colors.grey.shade600,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color:
                    isSelected ? const Color(0xFF5B7FCD) : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _getRouteForIndex(int index) {
    switch (index) {
      case 0:
        return '/home';
      case 1:
        return '/search';
      case 2:
        return '/panier';
      case 3:
        return '/profil';
      default:
        return null;
    }
  }
}
