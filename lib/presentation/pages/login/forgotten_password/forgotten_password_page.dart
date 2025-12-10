import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/login/forgotten_password/forgotten_password_controller.dart';

class ForgottenPasswordPage extends GetView<ForgottenPasswordController> {
  const ForgottenPasswordPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF3655B3),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()=>Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.arrow_back, 
                      color: Color(0xFF3655B3), 
                      size: 20,
                    ),

                  ),
                ),
                SizedBox(width: 20,),
                Text(
                  'Mot de passe oublié',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 100),

          Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          //Champ email de récupération
                          Obx(()=> TextField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                ),
                                hintText: 'Identifiant ou email',
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                errorText: controller.emailError.value.isEmpty
                                    ? null
                                    : controller.emailError.value,
                              ),
                          )),
                          const SizedBox(height: 10),
                          // Texte d'information
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text("*",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(" Nous vous enverrons un message pour \n réinitialiser votre nouveau mot de passe.",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Bouton de récupération de mot de passe
                          Obx(() => SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null: () {
                                            controller.sendResetCode();
                                          },
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
                                        "Soumettre",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            )),

                        ],
                      ),
                    ),
                  ),
            ),
        ],
      ),
    );
  }
  
}