// import 'dart:developer';
import 'package:code_initial/presentation/pages/category/category_binding.dart';
import 'package:code_initial/presentation/pages/category/category_page.dart';
import 'package:code_initial/presentation/pages/login/otp/otp_controller.dart';
import 'package:code_initial/presentation/pages/login/otp/otp_page.dart';
import 'package:code_initial/presentation/pages/login/login_controller.dart';
import 'package:code_initial/presentation/pages/login/login_page.dart';
import 'package:code_initial/presentation/pages/login/reset_password/reset_password_controller.dart';
import 'package:code_initial/presentation/pages/login/reset_password/reset_password_page.dart';
import 'package:code_initial/presentation/pages/panier/panier_controller.dart';
import 'package:code_initial/presentation/pages/panier/panier_page.dart';
import 'package:code_initial/presentation/pages/product_detail/product_detail_binding.dart';
import 'package:code_initial/presentation/pages/product_detail/product_detail_page.dart';
import 'package:code_initial/presentation/pages/profil/profil_controller.dart';
import 'package:code_initial/presentation/pages/profil/profil_page.dart';
import 'package:code_initial/presentation/pages/register/register_controller.dart';
import 'package:code_initial/presentation/pages/register/register_page.dart';
import 'package:code_initial/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:code_initial/presentation/pages/product_home/product_home_controller.dart';
import 'package:code_initial/presentation/pages/product_home/product_home_page.dart';
import 'package:code_initial/presentation/pages/login/forgotten_password/forgotten_password_page.dart';
import 'package:code_initial/presentation/pages/login/forgotten_password/forgotten_password_controller.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => SplashScreenPage(),
    ),
    GetPage(
      name: Routes.PRODUCT_HOME,
      page: () => ProductHomePage(),
      binding: ProductHomeBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
      GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.FORGOTTEN_PASSWORD, 
      page: ()=> ForgottenPasswordPage(),
      binding: ForgottenPasswordBinding(),
    ),
    GetPage(name: Routes.OTP,
     page: ()=> OtpPage(),
     binding: OtpBinding(),
     ),
     GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPasswordPage(),
      binding: ResetPasswordBinding(),
     ),
     GetPage(
      name: Routes.PANIER,
      page: () => PanierPage(),
      binding: PanierBinding(),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => ProfilPage(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    // AJOUTEZ CES 3 ROUTES POUR LE MENU BAS
    GetPage(
      name: Routes.CATEGORIES,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => Scaffold(
        appBar: AppBar(title: const Text('Recherche')),
        body: const Center(child: Text('Page Recherche')),
      ),
    ),
  ];
}


class Routes {
  static Future<String> get initialRoute async {
      return SPLASHSCREEN;
  }

  static const String MAIN = "/";

  static const FORGOTTEN_PASSWORD = '/forgotten_password';
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const ONBOARDING = '/onboarding';
  static const SPLASHSCREEN = '/splash_screen';
  static const PRODUCT_HOME = '/product-home';
  static const PRODUCT_DETAIL = '/product-detail';
  static const SEARCH = '/search';
  static const CATEGORIES = '/categories';
  static const OTP = '/otp';
  static const RESET_PASSWORD = '/reset_password';
  static const PANIER = '/panier';
  static const PROFIL = '/profil';
}
