import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/custom_textfield.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/authentication/login/controller/login_controller.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Torna o fundo transparente
        elevation: 0, // Remove a sombra da AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, // Ícone de voltar
            color: DesignSystemColors.primaryBlue, // Cor do ícone
          ),
          onPressed: () => Navigator.pop(context), // Volta para a tela anterior
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Acesse sua conta",
                                style: TextStyle(
                                    color: DesignSystemColors.primaryBlue,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const CustomTextfield(
                              title: "Endereço de E-mail", hint: "seu e-mail"),
                          const SizedBox(
                            height: 10,
                          ),
                          const CustomTextfield(
                              title: "Senha", hint: "sua Senha"),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Esqueceu da senha?",
                                style: TextStyle(
                                    color: DesignSystemColors.primaryBlue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 20), // Espaçamento para o botão
                          PrimaryButton(
                              onClick: controller.login,
                              text: "Entrar",
                              isGradient: false)
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
