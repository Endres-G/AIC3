import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<bool> isLoading = false.obs;
  RxInt currentIndex = 0.obs; // Índice da página atual
  TextEditingController factoryIdController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDiscriptionController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  TextEditingController price = TextEditingController();
  TextEditingController colorNameController = TextEditingController();
  TextEditingController productDiscription = TextEditingController();
  // TextEditingController productDiscription = TextEditingController();
  // TextEditingController productDiscription = TextEditingController();
  // TextEditingController productDiscription = TextEditingController();
  // TextEditingController productDiscription = TextEditingController();
  // TextEditingController productDiscription = TextEditingController();
  // TextEditingController productDiscription = TextEditingController();

  void exitMySession() {
    //apaga os dados em cache e volta para a welcome
    Get.find<GlobalController>().clearUserSession();
    print(Get.find<GlobalController>().userSession);
    Get.offAndToNamed(AppRoutes.welcome);
  }

  void sendToProduct() {
    print("vai pra pagina de registrar produto");
  }
}
