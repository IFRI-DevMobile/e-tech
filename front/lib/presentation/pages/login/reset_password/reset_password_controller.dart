import 'package:code_initial/navigation.dart';
import 'package:code_initial/presentation/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api_service/store_repository.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final passwordError = ''.obs;
  final confirmPasswordError = ''.obs;

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  final isLoading = false.obs;
  final email = Session().email;
  int userId = 0;

  final repository = StoreRepository();
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

  Future<void> user() async {
    try {
      var user = await repository.getUser(email);
      User user_1 = User(
          id: user.data['id'],
          name: user.data['name'],
          email: user.data['email']);
      userId = user_1.id;
    } catch (e) {
      Get.snackbar(
        'Erreur',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> resetPassword() async {
    if (validateInputs()) {
      isLoading.value = true;
      try {
        // Simuler une opération de réinitialisation
        user();
        await repository.editPassword(userId, passwordController.text);

        Get.snackbar(
          'Succès',
          'Mot de passe réinitialisé avec succès',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Naviguer vers la page de connexion ou autre
        Get.offNamed(Routes.LOGIN);
      } catch (e) {
        Get.snackbar(
          'Erreur avec l\'utilisateur $userId',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 60),
        );
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

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}
