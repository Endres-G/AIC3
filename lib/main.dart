import 'package:aic_lll/core/routes/app_page.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppEnv.loadEnv();
  print("Base URL carregada: ${AppEnv.baseUrl}");
  Get.put<GlobalController>(GlobalController(), permanent: true);

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}
