import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/navigation.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>{
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future <void> _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds:  3));
    if (mounted){
      Get.offNamed(Routes.ONBOARDING);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Color(0xFF3655B3),
        body: Center(
          child: 
          Text(
            'e-tech',
            style: TextStyle(
              fontSize: 64,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}

