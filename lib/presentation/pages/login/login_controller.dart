import 'package:code_initial/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  // Controllers des champs
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // États observables
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  // Messages d'erreur
  final emailError = ''.obs;
  final passwordError = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle visibilité mot de passe
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  // Validation
  bool _validateInputs() {
    bool isValid = true;

    // Reset erreurs
    emailError.value = '';
    passwordError.value = '';

    // Validation email
    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'L\'email est requis';
      isValid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Email invalide';
      isValid = false;
    }

    // Validation mot de passe
    final password = passwordController.text;
    if (password.isEmpty) {
      passwordError.value = 'Le mot de passe est requis';
      isValid = false;
    }

    return isValid;
  }

  // Connexion
  Future<void> login() async {
    if (!_validateInputs()) return;

    try {
      isLoading.value = true;

      // Simulation d'une requête réseau
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Succès',
        'Connexion réussie',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigation vers la page principale
      Get.offAllNamed(Routes.PRODUCT_HOME);
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Identifiants incorrects',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Mot de passe oublié
  Future<void> forgotPassword() async {
    Get.toNamed(Routes.FORGOTTEN_PASSWORD);
  }

  // Connexion avec Google
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      
      await Future.delayed(const Duration(seconds: 1));
      
      Get.snackbar(
        'Google',
        'Connexion avec Google',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Erreur',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Connexion avec Apple
  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;
  
      await Future.delayed(const Duration(seconds: 1));
      
      Get.snackbar(
        'Apple',
        'Connexion avec Apple',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Erreur',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Connexion avec Facebook
  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;
      
      await Future.delayed(const Duration(seconds: 1));
      
      Get.snackbar(
        'Facebook',
        'Connexion avec Facebook',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Erreur',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
