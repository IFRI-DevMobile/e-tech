import 'package:code_initial/presentation/pages/panier/panier_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanierController extends GetxController {

  final RxList <PanierPageModel> panierpage = <PanierPageModel> [].obs;
  final currentTabIndex = 0.obs;

  @override
  void onInit () {
    super.onInit();
    loadcartdata();
  }

  void loadcartdata () {
    panierpage.assignAll([
      PanierPageModel(
        nom: 'Smart watch',
        image: 'assets/images/smartwatch.jpg',
        prix: 180.0,
        quantite: 1
      ),
      PanierPageModel(
        nom: 'Téléviseur Qc8',
        image: 'assets/images/téléviseur.jpg',
        prix: 2300.0,
        quantite: 1
      ),
      PanierPageModel(
        nom: 'Ordinateur hp',
        image: 'assets/images/hp.jpg',
        prix: 465.0,
        quantite: 2
      ),
    ]);
  }

  double get prixTotal => panierpage.fold(0, (sum, item) => sum + item.prix);

  double get livraison => 50.0;

  double get prixFinal => prixTotal + livraison;

  void incrementQuantity (int index) {
    panierpage[index].quantite++;
    panierpage.refresh();
  }

  void decrementQuantity (int index) {
    if (panierpage[index].quantite > 1) {
      panierpage[index].quantite--;
      panierpage.refresh();
    }
  }

  void removeProduct (int index) {
    panierpage.removeAt(index);
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


class PanierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanierController>(() => PanierController());
  }
}