import 'package:aic_lll/global_controller.dart';
import 'package:get/instance_manager.dart';

class AplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
  }
}
