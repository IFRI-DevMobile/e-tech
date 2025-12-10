import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

    final otp = List<String>.filled(4, '').obs;
    final List<TextEditingController> textControllers =
      List.generate(4, (_) => TextEditingController());
    final isLoading = false.obs;
    String get code => otp.join();
    

    @override
    void onClose() {  
      for (var controller in textControllers) {
        controller.dispose();
      }
      super.onClose();
    }
    
    void setDigits(int index, String value) {
        // Si vide, on supprime la valeur
        if (value.isEmpty) {
          otp[index] = '';
          textControllers[index].text = '';
          return;
        }

        // Si l'utilisateur colle plusieurs caractères, ne prendre que le premier
        final digit = value.trim()[0];
        otp[index] = digit;
        textControllers[index].text = digit;
        // placer le curseur en fin (sécurité)
        textControllers[index].selection = TextSelection.collapsed(offset: 1);
    }

    Future<void> verify() async {
      final entered = code;
      if (entered.length < 4) {
        Get.snackbar('Erreur', 'Veuillez entrer les 4 chiffres');
        return;
      }
      isLoading.value = true;
      try {
        // remplacez par votre logique de vérification (API...)
        await Future.delayed(const Duration(seconds: 1));
        Get.snackbar('Succès', 'Code vérifié : $entered');
        Get.offAllNamed("/reset_password");
      } finally {
        isLoading.value = false;
      }
    }
}

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
  
}