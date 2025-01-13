import 'package:aic_lll/app_env.dart';
import 'package:aic_lll/authentication/models/auth_model.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/custom_overlay.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  Rx<bool> isLoading = false.obs;

  TextEditingController cnpjController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
    try {
      // Enviando dados do formulário para criar uma nova fábrica
      final result = await _client.post(
        "$baseUrl/factories",
        data: AuthModel(
          businessName: businessNameController.text,
          email: emailController.text,
          password: passwordController.text,
          cnpj: cnpjController.text,
          isActive: true,
        ).toJson(),
      );

      // Se a criação foi bem-sucedida
      if (result.statusCode == 200 || result.statusCode == 201) {
        // Agora, busque as informações detalhadas da fábrica recém-criada
        final factoryResult = await _client.get(
          "$baseUrl/factories/${result.data["id"]}",
        );
        print(factoryResult.data);
        print(factoryResult.statusCode);

        // Se a requisição para obter dados da fábrica foi bem-sucedida
        if (factoryResult.statusCode == 200 ||
            factoryResult.statusCode == 201) {
          // Salvar as informações da fábrica na sessão do usuário
          await Get.find<GlobalController>()
              .saveUserSession(factoryResult.data);

          CustomOverlay.success("Registrado com sucesso!");
          Get.offAndToNamed(AppRoutes.homePageView);
        } else {
          // Caso o carregamento das informações falhe
          CustomOverlay.error(
            "Erro ao carregar as informações da fábrica. Status: ${factoryResult.statusCode}",
          );
        }
      } else {
        // Se a requisição de registro falhar
        CustomOverlay.error("Erro ao registrar. Status: ${result.statusCode}");
      }
    } on Exception catch (e) {
      // Captura de exceções
      CustomOverlay.error("Erro ao registrar: ${e.toString()}");
    }
  }
}
