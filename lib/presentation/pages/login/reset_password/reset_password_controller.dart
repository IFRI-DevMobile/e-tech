import 'package:code_initial/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final passwordError = ''.obs;
  final confirmPasswordError = ''.obs;

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  final isLoading = false.obs;

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  bool validateInputs() {
    bool isValid = true;

    // Reset erreurs
    passwordError.value = '';
    confirmPasswordError.value = '';
  
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

  Future<void> resetPassword() async {
    if (validateInputs()) {
      isLoading.value = true;
      try {
        // Simuler une opération de réinitialisation
        await Future.delayed(const Duration(seconds: 2));
        Get.snackbar(
          'Succès',
          'Mot de passe réinitialisé avec succès',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Naviguer vers la page de connexion ou autre
        Get.offNamed(Routes.LOGIN);
      } finally {
        isLoading.value = false;
      }
    }
  }
}

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}