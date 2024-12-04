import 'package:aic_lll/app_env.dart';
import 'package:aic_lll/authentication/models/auth_model.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/custom_overlay.dart';
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
      final result = await _client.post("$baseUrl/auth/login",
          data: AuthModel(
                  email: emailController.text,
                  password: passwordController.text,
                  userType: "factory")
              .loginToJson());

      if (result.statusCode == 200 || result.statusCode == 201) {
        CustomOverlay.success("logado!!");
        Get.toNamed(AppRoutes.homePageView);
      }
    } on Exception catch (e) {
      CustomOverlay.error("Erro ao logar!");
    }
  }
}
