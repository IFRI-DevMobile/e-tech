import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/login/otp/otp_controller.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

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
                  'Entrez le code OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),
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
                          //Champ OTP (centré)
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(4, (index) {
                                return Container(
                                  width: 60,
                                  height: 60,
                                  margin: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: TextField(
                                      controller: controller.textControllers[index],
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      maxLength: 1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: const InputDecoration(
                                        counterText: '',
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        // mettre à jour le contrôleur et avancer le focus
                                        controller.setDigits(index, value);
                                        if (value.isNotEmpty && index < 3) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Texte d'information
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text(" * Ajoutez le code OTP qui vous a été envoyé sur \nl’adresse e-mail que vous avez saisie \n précédemment.",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                
                              ],
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Bouton de validation du code OTP
                          Obx(() => SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: controller.isLoading.value
                                    ? null: () {
                                            controller.verify();
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