import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'onboarding_controller.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page_model.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: OnboardingScreen(
        pages: [
          OnboardingPageModel(
            index: 1,
            title: '',
            description: "",
            imagePath: 'assets/images/ordinateur.jpg',
            buttonText: 'Commençons',
          ),
          OnboardingPageModel(
            index: 2,
            title: 'Découvre ton type\nd\'équipement',
            description: "Astuces pour choisir le \n matériel idéal",
            imagePath: 'assets/images/ordinateur.jpg',
            buttonText: 'Continue',
          ),
          OnboardingPageModel(
            index: 3,
            title: 'Trouve de bonnes\noptions sans te\ntromper',
            description: "Rejoins-nous",
            buttonText: 'S inscrire',
            textColor: const Color.fromARGB(255, 9, 67, 165)
          ),
        ],
      )),
    );
  }
}
