import 'package:code_initial/navigation.dart';
import 'package:code_initial/presentation/pages/profil/profil_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {

  // final RxList <User> user = <User> [].obs;
  final currentTabIndex = 0.obs;
  final RxBool isEditing = false.obs;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController telephoneController;
  late TextEditingController villeController;
  late TextEditingController paysController;

  @override
  void onInit () {
    super.onInit();
    _initializeControllers();
    user();
  }

  @override
  void onClose () {
    _disposeControllers();
    super.onClose();
  }

  void _initializeControllers() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    telephoneController = TextEditingController();
    villeController = TextEditingController();
    paysController = TextEditingController();
  }

  void _disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    telephoneController.dispose();
    villeController.dispose();
    paysController.dispose();
  }

  Rx<User> user = User(
    id:'1',
    name:'Joe',
    email: 'example@gmail.com',
    telephone: '01 51 51 13 10',
    ville: 'Cotonou',
    pays: 'Bénin',
    avatarColor: Colors.tealAccent,
  ).obs; 


  void updateProfil (){
    nameController.text = user.value.name;
    emailController.text = user.value.email;
    telephoneController.text = user.value.telephone ?? '';
    villeController.text = user.value.ville ?? '';
    paysController.text = user.value.pays ?? '';
  }

  void toogleEditMode() {
    if (isEditing.value){
      updateProfil();
      isEditing.value = false;
    } else {
      isEditing.value = true;
    }
  }

  void saveProfil() {
    if(nameController.text.trim().isEmpty){
      Get.snackbar(
        'Erreur',
        'Le nom est requis',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }
    if(emailController.text.trim().isEmpty){
      Get.snackbar(
        'Erreur',
        'Le mail est requis',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    try{
      user.value.name = nameController.text.trim();
      user.value.email = emailController.text.trim();
      user.value.telephone = telephoneController.text.trim();
      user.value.ville = villeController.text.trim();
      user.value.pays = paysController.text.trim();

      user.refresh();
      isEditing.value = false;

      Get.snackbar(
        'Succès',
        'Profil mis à jour avec succès',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
        duration: Duration(seconds: 1),
      );
    }catch (e) {
      Get.snackbar(
        'Erreur',
        'Impossible de sauvegarder le profil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  void deconnexion() {
    Get.offNamed(Routes.LOGIN);
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

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}