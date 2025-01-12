import 'dart:convert';

import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileView extends GetView<HomeController> {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              //chamada controller que vai deslogar e mandar para a welcome
                              controller.exitMySession();
                            },
                          ),
                        ],
                      ),
                      Card(
                        color: Colors.transparent, // Remove o fundo do card

                        elevation: 0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: ListTile(
                          leading: Get.find<GlobalController>()
                                      .userSession
                                      .profileImage !=
                                  null
                              ? Image.memory(
                                  base64Decode(Get.find<GlobalController>()
                                      .userSession
                                      .profileImage!), // Supondo que a imagem seja codificada em base64
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons
                                  .image_not_supported), // Imagem do produto ou ícone de erro
                          title: Text(Get.find<GlobalController>()
                              .userSession
                              .businessName!),
                        ),
                      ),
                      // const Divider(),
                      PrimaryButton(
                        onClick: () => Get.toNamed(AppRoutes.editProfile),
                        text: "Editar perfil",
                        isGradient: false,
                      ),
                      // const Text(
                      // "opção de finalizar cadastro do user, com foto. banner e valor min de pagamento e oq falta"),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
