import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/login/login_controller.dart';
import 'package:code_initial/presentation/pages/login/login_page.dart';
import 'package:code_initial/presentation/pages/register/register_controller.dart';
import 'package:code_initial/presentation/pages/register/register_page.dart';
import 'package:code_initial/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_controller.dart';
import 'package:code_initial/presentation/pages/product_home/product_home_controller.dart';
import 'package:code_initial/presentation/pages/product_home/product_home_page.dart';
import 'package:code_initial/presentation/pages/product_detail/product_detail_page.dart';
import 'package:code_initial/presentation/pages/product_detail/product_detail_binding.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => const SplashScreenPage(),
    ),
    GetPage(
      name: Routes.productHome,
      page: () => const ProductHomePage(),
      binding: ProductHomeBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    // ROUTE POUR LA PAGE DÉTAIL PRODUIT
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),
    // AJOUTEZ CES 3 ROUTES POUR LE MENU BAS
    GetPage(
      name: Routes.SEARCH,
      page: () => Scaffold(
        appBar: AppBar(title: const Text('Recherche')),
        body: const Center(child: Text('Page Recherche')),
      ),
    ),
    GetPage(
      name: Routes.CART,
      page: () => Scaffold(
        appBar: AppBar(title: const Text('Panier')),
        body: const Center(child: Text('Page Panier')),
      ),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => Scaffold(
        appBar: AppBar(title: const Text('Profil')),
        body: const Center(child: Text('Page Profil')),
      ),
    ),
  ];
}

class Routes {
  static Future<String> get initialRoute async {
    return SPLASHSCREEN;
  }

  static const String MAIN = "/";
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const ONBOARDING = '/onboarding';
  static const SPLASHSCREEN = '/splash_screen';
  static const productHome = '/product-home';
  static const PRODUCT_DETAIL = '/product-detail';
  // AJOUTEZ CES 3 LIGNES
  static const SEARCH = '/search';
  static const CART = '/cart';
  static const PROFILE = '/profile';
}