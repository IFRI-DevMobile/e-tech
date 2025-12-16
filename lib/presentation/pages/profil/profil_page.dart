import 'package:code_initial/presentation/pages/profil/profil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilPage extends GetView<ProfilController> {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3655B3),
      body:Obx(() {
        if (controller.isLoading.value && controller.userProfile.value == null) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF3655B3),
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Profil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),       
                ],
              ),
            ),

            SizedBox(height: 20,),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          InfoField(label: 'Name',controller: controller.nameController,enabled: controller.isEditing.value),
                          SizedBox(height: 8,),
                          InfoField(label: 'Email',controller: controller.emailController,enabled: controller.isEditing.value),
                          SizedBox(height: 8,),
                          InfoField(label: 'Téléphone',controller: controller.telephoneController,enabled: controller.isEditing.value),
                          SizedBox(height: 8,),
                          InfoField(label: 'Ville',controller: controller.villeController,enabled: controller.isEditing.value),
                          SizedBox(height: 8,),
                          InfoField(label: 'Pays',controller: controller.paysController,enabled: controller.isEditing.value),
                          SizedBox(height: 30,),
                          ActionsButton(),
                        ],
                      )
                    ],
                  ),
                ),
              )
              ),
          ],
        );
      }),
      
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget InfoField({
    required String label,
    required TextEditingController controller,
    required bool enabled,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 6,),

        TextField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[50],
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFF3655B3),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color(0xFF3655B3),
                width: 2,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1.5,
              ),
            ),
          ),
          style: TextStyle(
            fontSize: 14,
            color: enabled ? Colors.black87 : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget ActionsButton() {
    return Obx(() {
      if(controller.isEditing.value) {
        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: controller.isLoading.value
                  ? null
                  : controller.toogleEditMode,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Color(0xFF3655B3), width: 2),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ), 
                ),  
                child: Text(
                  'Annuler',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3655B3),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12,),
            Expanded(
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                  ? null
                  : controller.saveProfil,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3655B3),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0, 
                ),
                child: controller.isLoading.value
                  ? SizedBox(
                    height: 20,width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                  : Text(
                    'Enregistrer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ), 
              ),
            ),
          ],
        );
      }else {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.toogleEditMode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3655B3),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0, 
                ),
                child: Text(
                  'Modifier',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ), 
              ),
            ),
            SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: controller.deconnexion,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.red, width: 2),
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Déconnecter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ), 
              ),
            ),
          ],
        );
      }
    });
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
