import 'dart:convert';

import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
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
                      // Substituindo o Row e IconButton por ListTiles
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

                      // ListTile para editar perfil
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text("Editar perfil"),
                        onTap: () => Get.toNamed(AppRoutes.editProfile),
                      ),

                      // ListTile para sair da conta
                      ListTile(
                        leading: const Icon(Icons.exit_to_app),
                        title: const Text("Sair da conta"),
                        onTap: () => controller.exitMySession(),
                      ),

                      // Opções de ações podem continuar aqui, como o PrimaryButton
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
