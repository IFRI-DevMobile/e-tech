import 'package:get/get.dart';
import 'package:code_initial/presentation/pages/category/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
