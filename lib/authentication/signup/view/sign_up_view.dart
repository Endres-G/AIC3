import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/custom_textfield.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/authentication/signup/controller/sign_up_controller.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Chave global para o formulário

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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Crie sua conta",
                                style: TextStyle(
                                    color: DesignSystemColors.primaryBlue,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextfield(
                                  title: "CNPJ",
                                  hint: "o CNPJ da Empresa",
                                  controller: controller.cnpjController,
                                  validator: (cnpj) {
                                    if (cnpj == null || cnpj.isEmpty) {
                                      return "CNPJ é obrigatório.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextfield(
                                  title: "Nome da Empresa",
                                  hint: "o nome da Empresa",
                                  controller: controller.businessNameController,
                                  validator: (name) {
                                    if (name == null || name.isEmpty) {
                                      return "Nome da empresa é obrigatório.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextfield(
                                  title: "Endereço de E-mail",
                                  hint: "seu e-mail",
                                  controller: controller.emailController,
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return "E-mail é obrigatório.";
                                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                        .hasMatch(email)) {
                                      return "Digite um e-mail válido.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextfield(
                                  title: "Senha",
                                  hint: "sua senha",
                                  controller: controller
                                      .passwordController, // Controller para senha
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return "Senha é obrigatória.";
                                    } else if (password.length < 6) {
                                      return "A senha deve ter no mínimo 6 caracteres.";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 10),
                                CustomTextfield(
                                  title: "Confirma a Senha",
                                  hint: "sua senha",
                                  controller: controller
                                      .confirmPasswordController, // Controller para confirmação de senha
                                  validator: (passwordConfirm) {
                                    if (passwordConfirm == null ||
                                        passwordConfirm.isEmpty) {
                                      return "Confirmação de senha é obrigatória.";
                                    } else if (passwordConfirm !=
                                        controller.passwordController.text) {
                                      // Aqui comparamos as senhas
                                      return "As senhas devem ser iguais.";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                              height: 20), // Espaçamento para o botão
                          PrimaryButton(
                              onClick: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  controller.signUp();
                                }
                              },
                              text: "Criar conta",
                              isGradient: false),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Já tem uma conta?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  // Ação que será realizada ao clicar no botão
                                  Get.toNamed(AppRoutes.login);
                                },
                                child: const Text(
                                  "Entre agora",
                                  style: TextStyle(
                                    color: DesignSystemColors.primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          )
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
