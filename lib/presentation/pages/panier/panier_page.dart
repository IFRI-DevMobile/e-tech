import 'package:code_initial/presentation/pages/panier/panier_controller.dart';
import 'package:code_initial/presentation/pages/panier/panier_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanierPage extends GetView<PanierController> {
  const PanierPage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
           icon: Icon(Icons.arrow_back_ios, color: Colors.black)
        ),
        title: Text(
          'Panier',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(() {

        if (controller.panierpage.isEmpty){
          return buildEmptyCart();
        }
        return Stack(
          children: [
            Positioned.fill(
              top: 0,
              left: 0,
              right: 0,
              bottom: 280,
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.panierpage.length,
                itemBuilder: (context, index) {
                  final item = controller.panierpage[index];
                  return CardItemCard(item: item, index: index,);
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: buildBottomSection(),
            ),
          ],
        );
      }
      ),

      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );  
  }

  Widget buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Votre panier est vide',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3655B3),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'Continuer vos achats',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildBottomSection() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF3655B3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(24),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() =>Column(
              children: [
                PriceRow('Total', '\$${controller.prixTotal.toString()}', false),
                SizedBox(height: 12,),
                PriceRow('Frais de livraison', '\$${controller.livraison.toString()}', false),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Divider(color: Colors.white,thickness: 1,),
                ),
                PriceRow('Total', '\$${controller.prixFinal.toString()}', true),
              ],
            )),

            SizedBox(height: 20,),

            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 80),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Text(
                  'Soumettre',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        )
        ),
    );
  }

  Widget PriceRow(String label, String prixgeneral, bool isBold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: isBold ? 18: 16,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          prixgeneral,
          style: TextStyle(
            color: Colors.white,
            fontSize: isBold ? 20: 16,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
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
              color: isSelected ? const Color(0xFF5B7FCD) : Colors.grey.shade600,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? const Color(0xFF5B7FCD) : Colors.grey.shade600,
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
        return '/product-home';
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

class CardItemCard extends StatelessWidget {
  final PanierPageModel item;
  final int index;

  const CardItemCard({
    super.key,
    required this.item,
    required this.index,
     });
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PanierController>();

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                item.image,
                width: 50,
                height: 50,
              ),
            ),
          ),

          SizedBox(width: 12,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.nom,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4,),
                Text(
                  '\$${item.prix.toString()}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4,),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () => 
                        controller.decrementQuantity(index),
                      child: Icon(Icons.remove_circle,
                        color: Color(0xFF3655B3).withOpacity(0.1)
                        ),
                    ),
                    SizedBox(width: 8,),
                    Obx(()=>Text(
                      controller.panierpage.length > index
                      ? controller.panierpage[index].quantite.toString()
                      :'0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                    )),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: () => 
                        controller.incrementQuantity(index),
                      child: Icon(Icons.add_circle,
                        color: Color(0xFF3655B3).withOpacity(0.1)
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () => controller.removeProduct(index),
             icon: Icon(Icons.delete_outline),
             color: Color(0xFF3655B3),
             iconSize: 24,
          ),
        ],
      ),
    );
  }
}
