import 'package:code_initial/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_service/store_repository.dart';

class RegisterController extends GetxController {
  // Controllers des champs
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // États observables
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final isLoading = false.obs;

  // Messages d'erreur
  final nameError = ''.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final confirmPasswordError = ''.obs;

  final repository = StoreRepository();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle visibilité mot de passe
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  // Validation
  bool _validateInputs() {
    bool isValid = true;

    // Reset erreurs
    nameError.value = '';
    emailError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';

    // Validation nom
    final name = nameController.text.trim();
    if (name.isEmpty) {
      nameError.value = 'Le nom et prénom sont requis';
      isValid = false;
    }

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
    } else if (password.length < 6) {
      passwordError.value = 'Minimum 6 caractères';
      isValid = false;
    }

    // Validation confirmation
    final confirmPassword = confirmPasswordController.text;
    if (confirmPassword.isEmpty) {
      confirmPasswordError.value = 'Confirmez votre mot de passe';
      isValid = false;
    } else if (password != confirmPassword) {
      confirmPasswordError.value = 'Les mots de passe ne correspondent pas';
      isValid = false;
    }

    return isValid;
  }

  // Inscription
  Future<void> register() async {
    if (!_validateInputs()) return;

    try {
      isLoading.value = true;

      // Simulation d'une requête réseau
      await repository.registerUser(
        nameController.text,
        emailController.text,
        passwordController.text,
      );

      Get.snackbar(
        'Succès',
        'Compte créé avec succès',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Navigation vers la page principale ou login
      Get.offNamed(Routes.LOGIN);
    } catch (e) {
      Get.snackbar(
        'Erreur',
        'Une erreur est survenue: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
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
        'Connexion avec Facebook ',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Erreur', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 60));
    } finally {
      isLoading.value = false;
    }
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
