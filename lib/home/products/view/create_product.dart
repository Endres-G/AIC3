import 'package:aic_lll/core/widgets/custom_textfield.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProduct extends GetView<HomeController> {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final _formProductKey =
        GlobalKey<FormState>(); // Chave global para o formulário do produto

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Form(
                          key: _formProductKey,
                          child: Column(
                            children: [
                              CustomTextfield(
                                title: "Endereço de E-mail",
                                hint: "seu e-mail",
                                controller: controller.colorNameController,
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
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextfield(
                                title: "Senha",
                                hint: "sua Senha",
                                controller: controller.colorNameController,
                                validator: (password) {
                                  if (password == null || password.isEmpty) {
                                    return "Senha é obrigatória.";
                                  } else if (password.length < 6) {
                                    return "A senha deve ter no mínimo 6 caracteres.";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
