import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/services/navigation_service.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    asyncInit();
    super.onInit();
  }

  Future<void> asyncInit() async {
    await Future.delayed(const Duration(seconds: 3));
    final session = await Get.find<GlobalController>().getUserSession();

    if (session != null && session.accessToken.isNotEmpty) {
      NavigationService.pageToOffAllNamed(AppRoutes.homePageView);
    } else {
      NavigationService.pageToOffAllNamed(AppRoutes.welcome);
    }
  }
}
