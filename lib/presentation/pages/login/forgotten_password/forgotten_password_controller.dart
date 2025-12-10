import 'package:code_initial/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgottenPasswordController extends GetxController {
  
  final emailController = TextEditingController();
  final emailError = ''.obs;
  final isLoading = false.obs;

  // à la fermeture 
  @override 
  void onClose(){
    emailController.dispose();
    super.onClose();
  }
  // Validation email
  bool validateInputs(){
    bool isValid = true; 
    final email = emailController.text.trim();
    if (email.isEmpty) {
        emailError.value = 'L\'email est requis';
        isValid = false;
      } else if (!GetUtils.isEmail(email)) {
        emailError.value = 'Email invalide';
        isValid = false;
      }
    return isValid;
  }
  
  Future<void> sendResetCode() async {
    if (validateInputs()){
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      Get.snackbar(
        'Succès',
        'Code de réinitialisation envoyé à votre email',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      isLoading.value = false;
      Get.toNamed(Routes.OTP);
    }
  }
}
class ForgottenPasswordBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ForgottenPasswordController>(()=> ForgottenPasswordController());
  }
}
