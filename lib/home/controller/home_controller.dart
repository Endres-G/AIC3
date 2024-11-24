import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<bool> isLoading = false.obs;

  void sendToProduct() {
    print("vai pra pagina de registrar produto");
    Get.toNamed(AppRoutes.product);
  }
}
