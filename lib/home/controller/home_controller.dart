import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxInt currentIndex = 0.obs; // Índice da página atual

  void sendToProduct() {
    print("vai pra pagina de registrar produto");
  }
}
