import 'package:aic_lll/authentication/welcome/widget/welcome_appbar.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/authentication/welcome/controller/welcome_controller.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const WelcomeAppbar(),
                      PrimaryButton(
                        onClick: () => Get.toNamed(AppRoutes.signUp),
                        text: "Criar uma conta",
                        isGradient: true,
                      ),
                      const SizedBox(height: 10),
                      PrimaryButton(
                        onClick: () => Get.toNamed(AppRoutes.login),
                        text: "Já tenho uma conta",
                        isGradient: true,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
