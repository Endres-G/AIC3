import 'package:aic_lll/app_env.dart';
import 'package:aic_lll/authentication/models/auth_model.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/custom_overlay.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<bool> isLoading = false.obs;
  TextEditingController cnpjController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Dio _client = Dio();
  final baseUrl = AppEnv.baseUrl;

  @override
  void dispose() {
    //ele limpa os dados da arvore quando fechamos o widget
    cnpjController.dispose();
    businessNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    try {
      final resultado = await _client.post("$baseUrl/auth/login",
          data: AuthModel(
                  email: emailController.text,
                  password: passwordController.text,
                  userType: "factory")
              .loginToJson());

      if (resultado.statusCode == 200 || resultado.statusCode == 201) {
        final result = await _client.get(
          "$baseUrl/factories/${resultado.data["id"]}",
        );
        print(result.data);
        print(result.statusCode);

        if (result.statusCode == 200 || result.statusCode == 201) {
          await Get.find<GlobalController>().saveUserSession(result.data);
        } else {
          CustomOverlay.error(
              "Erro ao carregar as informações. Status: ${result.statusCode}");
        }
        CustomOverlay.success("logado!!");
        Get.offAndToNamed(AppRoutes.homePageView);
      }
    } on Exception catch (e) {
      CustomOverlay.error(e.toString());
    }
  }
}
