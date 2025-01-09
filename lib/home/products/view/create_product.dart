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
                                title: "Identificação da fabrica",
                                hint: "id",
                                controller: controller.colorNameController,
                                // validator: (fabId) {
                                //   if (fabId == null || fabId.isEmpty) {
                                //     return "E-mail é obrigatório.";
                                //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                //       .hasMatch(fabId)) {
                                //     return "Digite um e-mail válido.";
                                //   }
                                //   return null;
                                // },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextfield(
                                title: "Descrição do produto",
                                hint: "Descrição do produto",
                                controller: controller.colorNameController,
                                // validator: (password) {
                                //   if (password == null || password.isEmpty) {
                                //     return "Senha é obrigatória.";
                                //   } else if (password.length < 6) {
                                //     return "A senha deve ter no mínimo 6 caracteres.";
                                //   }
                                //   return null;
                                // },
                              ),
                              CustomTextfield(
                                title: "Identificação da categoria",
                                hint: "id",
                                controller: controller.colorNameController,
                                // validator: (password) {
                                //   if (password == null || password.isEmpty) {
                                //     return "Senha é obrigatória.";
                                //   } else if (password.length < 6) {
                                //     return "A senha deve ter no mínimo 6 caracteres.";
                                //   }
                                //   return null;
                                // },
                              ),
                              CustomTextfield(
                                title: "status",
                                hint: "status",
                                controller: controller.colorNameController,
                                // validator: (password) {
                                //   if (password == null || password.isEmpty) {
                                //     return "Senha é obrigatória.";
                                //   } else if (password.length < 6) {
                                //     return "A senha deve ter no mínimo 6 caracteres.";
                                //   }
                                //   return null;
                                // },
                              ),
                              SizedBox(
                                height: 150,
                              ),
                              CustomTextfield(
                                title: "preço",
                                hint: "preço",
                                controller: controller.colorNameController,
                                // validator: (password) {
                                //   if (password == null || password.isEmpty) {
                                //     return "Senha é obrigatória.";
                                //   } else if (password.length < 6) {
                                //     return "A senha deve ter no mínimo 6 caracteres.";
                                //   }
                                //   return null;
                                // },
                              ),
                              CustomTextfield(
                                title: "Nome da cor",
                                hint: "cor",
                                controller: controller.colorNameController,
                                // validator: (password) {
                                //   if (password == null || password.isEmpty) {
                                //     return "Senha é obrigatória.";
                                //   } else if (password.length < 6) {
                                //     return "A senha deve ter no mínimo 6 caracteres.";
                                //   }
                                //   return null;
                                // },
                              ),
                              CustomTextfield(
                                title: "Hex da cor",
                                hint: "hex da cor",
                                controller: controller.colorNameController,
                                // validator: (password) {
                                //   if (password == null || password.isEmpty) {
                                //     return "Senha é obrigatória.";
                                //   } else if (password.length < 6) {
                                //     return "A senha deve ter no mínimo 6 caracteres.";
                                //   }
                                //   return null;
                                // },
                              ),
                              CustomTextfield(
                                title: "Material do produto",
                                hint: "Material",
                                controller: controller.colorNameController,
                              ),
                              CustomTextfield(
                                title: "largura do produto",
                                hint: "largura",
                                controller: controller.colorNameController,
                              ),
                              CustomTextfield(
                                title: "comprimento do produto",
                                hint: "comprimento",
                                controller: controller.colorNameController,
                              ),
                              CustomTextfield(
                                title: "altura do produto",
                                hint: "altura",
                                controller: controller.colorNameController,
                              ),
                              CustomTextfield(
                                title: "estoque do produto",
                                hint: "estoque",
                                controller: controller.colorNameController,
                              ),
                              CustomTextfield(
                                title: "imagem do produto",
                                hint: "img",
                                controller: controller.colorNameController,
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
