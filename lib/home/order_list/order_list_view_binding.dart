import 'package:aic_lll/home/order_list/controller/order_list_controller.dart';
import 'package:get/get.dart';

class OrderListViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OrderListController>(OrderListController());
  }
}
