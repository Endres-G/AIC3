import 'package:aic_lll/home/controller/home_page_view_controller.dart';
import 'package:get/get.dart';

class HomePageViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomePageViewController>(HomePageViewController());
  }
}
