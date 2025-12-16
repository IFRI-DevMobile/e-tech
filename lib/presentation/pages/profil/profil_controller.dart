import 'package:code_initial/navigation.dart';
import 'package:code_initial/presentation/pages/profil/profil_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {

  final Rx<User?> userProfile = Rx<User?>(null);

  final currentTabIndex = 0.obs;
  final RxBool isLoading = false.obs;
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

  Future<void> user() async {
    try {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 1));

      // Données de test
      userProfile.value = User(
        id:'1',
        name:'Joe',
        email: 'joedoe@gmail.com',
        telephone: '01 97 10 11 12',
        ville: 'Cotonou',
        pays: 'Bénin',
        avatarColor: Colors.tealAccent,
      );

      updateProfil();
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Impossible de charger le profil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    } finally {
      isLoading.value = false;
    }
  }


  void updateProfil () {
    if(userProfile.value != null) {
      nameController.text = userProfile.value!.name;
      emailController.text = userProfile.value!.email;
      telephoneController.text = userProfile.value?.telephone ?? '';
      villeController.text = userProfile.value?.ville ?? '';
      paysController.text = userProfile.value?.pays ?? '';
    }
  }

  void toogleEditMode() {
    if (isEditing.value){
      updateProfil();
      isEditing.value = false;
    } else {
      isEditing.value = true;
    }
  }

  Future<void> saveProfil() async {
    if (userProfile.value == null) return;

    //validation
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
      isLoading.value = true;

      userProfile.value!.name = nameController.text.trim();
      userProfile.value!.email = emailController.text.trim();
      userProfile.value!.telephone = telephoneController.text.trim();
      userProfile.value!.ville = villeController.text.trim();
      userProfile.value!.pays = paysController.text.trim();

      await Future.delayed(const Duration(seconds: 1));

      userProfile.refresh();
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
    }finally {
      isLoading.value = false;
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