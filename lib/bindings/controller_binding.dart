import 'package:get/get.dart';
import 'package:softbenz_task/controllers/category.dart';
import 'package:softbenz_task/controllers/product.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
    Get.put(ProductController());
  }
}
