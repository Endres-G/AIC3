import 'package:aic_lll/app_env.dart';
import 'package:aic_lll/authentication/models/auth_model.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<bool> isLoading = false.obs;

  TextEditingController cnpjController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Dio _client = Dio();
  final baseUrl = AppEnv.baseUrl;
  void dispose() {
    cnpjController.dispose();
    businessNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final result = await _client.post("$baseUrl/factories",
        data: AuthModel(
          businessName: businessNameController.text,
          email: emailController.text,
          password: passwordController.text,
          cnpj: cnpjController.text,
          isActive: true,
        ).toJson());

    if (result.statusCode == 200 || result.statusCode == 201) {
      print("logado com sucesso");
      Get.toNamed(AppRoutes.home);
    } else {
      print("erro");
    }
  }
}
