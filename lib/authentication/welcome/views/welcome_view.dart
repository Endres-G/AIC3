import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/authentication/welcome/controller/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: const Text("Login"),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signUp);
                        },
                        child: Text("Registro"),
                      ),
                    ],
                  ),
                )))),
    );
  }
}
