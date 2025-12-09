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
            title: 'EXPLORE ET\nCHOISIS EN\nTOUTE CONFIANCE',
            description: "",
            imagePath: 'assets/images/ordinateur.jpg',
            buttonText: 'Commençons',
          ),
          OnboardingPageModel(
            title: 'Découvre ton type\nd\'équipement',
            description: "Astuces pour choisir le matériel idéal",
            imagePath: 'assets/images/ordinateur.jpg',
            buttonText: 'Continue',
          ),
          OnboardingPageModel(
            title: 'Trouve de bonnes\noptions sans te\ntromper',
            description: "Rejoins-nous",
            imagePath: 'assets/images/blanc.png',
            buttonText: 'S inscrire',

          ),
        ],
      )),
    );
  }
}
