import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/login/reset_password/reset_password_controller.dart';

class ResetPasswordPage extends GetView <ResetPasswordController>{
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3655B3),
      body: SafeArea(
        child: Column(
          children: [
            // Header avec bouton retour
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
                        borderRadius: BorderRadius.circular(50),
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
                    "Réinitialiser le mot de passe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Carte blanche avec formulaire
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
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Champ Mot de passe
                      Obx(() => TextField(
                        controller: controller.passwordController,
                        obscureText: controller.obscurePassword.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                          hintText: 'Mot de passe',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          errorText: controller.passwordError.value.isEmpty
                              ? null
                              : controller.passwordError.value,
                        ),
                      )),

                      const SizedBox(height: 16),

                      // Champ Confirmer mot de passe
                      Obx(() => TextField(
                        controller: controller.confirmPasswordController,
                        obscureText: controller.obscureConfirmPassword.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.obscureConfirmPassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: controller.toggleConfirmPasswordVisibility,
                          ),
                          hintText: 'Confirme le Mot de passe',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          errorText: controller.confirmPasswordError.value.isEmpty
                              ? null
                              : controller.confirmPasswordError.value,
                        ),
                      )),

                      const SizedBox(height: 24),

                      // Bouton Se connecter
                      Obx(() => SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.resetPassword,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3655B3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text(
                                  "Réinitialiser ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      )),

                      const SizedBox(height: 24),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
