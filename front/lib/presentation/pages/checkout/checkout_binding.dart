import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/checkout/checkout_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(
      () => CheckoutController(),
      fenix: true,
    );
  }
}
