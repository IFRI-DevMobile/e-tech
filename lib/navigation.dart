// import 'dart:developer';
import 'package:code_initial/presentation/pages/login/login_controller.dart';
import 'package:code_initial/presentation/pages/login/login_page.dart';
import 'package:code_initial/presentation/pages/panier/panier_controller.dart';
import 'package:code_initial/presentation/pages/panier/panier_page.dart';
import 'package:code_initial/presentation/pages/profil/profil_controller.dart';
import 'package:code_initial/presentation/pages/profil/profil_page.dart';
import 'package:code_initial/presentation/pages/register/register_controller.dart';
import 'package:code_initial/presentation/pages/register/register_page.dart';
import 'package:code_initial/presentation/pages/splashscreen/splash_screen_page.dart';
import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_page.dart';
import 'package:code_initial/presentation/pages/onboarding/onboarding_controller.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASHSCREEN,
      page: () => SplashScreenPage(),
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
      name: Routes.PANIER,
      page: () => PanierPage(),
      binding: PanierBinding(),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => ProfilPage(),
      binding: ProfileBinding(),
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
  static const PANIER = '/panier';
  static const PROFIL = '/profil';
}
