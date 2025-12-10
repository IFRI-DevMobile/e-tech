import 'package:code_initial/presentation/pages/profil/profil_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {

  final RxList <User> user = <User> [].obs;
  final currentTabIndex = 0.obs;

  @override
  void onInit () {
    super.onInit();
    loaduserdata();
  }

  void loaduserdata () {
    user.assignAll([
      User(
        id:'1',
        name:'Joe',
        email: 'example@gmail.com',
        avatarColor: Colors.tealAccent,
      ),
    ]);
  }

  void updateProfil (String newName){}

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

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}