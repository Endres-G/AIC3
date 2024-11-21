import 'package:aic_lll/products/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}
