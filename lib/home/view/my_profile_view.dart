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
                      Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          leading: Get.find<GlobalController>()
                                      .userSession
                                      .profileImage !=
                                  null
                              ? ClipOval(
                                  child: Image.memory(
                                    base64Decode(
                                      Get.find<GlobalController>()
                                          .userSession
                                          .profileImage!,
                                    ),
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Icon(Icons.image_not_supported),
                          title: Text(
                            Get.find<GlobalController>()
                                .userSession
                                .businessName!,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // ListTile para editar perfil
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text("Editar perfil"),
                        onTap: () => Get.toNamed(AppRoutes.editProfile),
                      ),

                      // ListTile para sair da conta
                      ListTile(
                        leading: const Icon(Icons.payment),
                        title: const Text("Métodos de pagamento"),
                        onTap: () => print("Métodos de pagamento"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.delivery_dining),
                        title: const Text("Métodos de entrega"),
                        onTap: () => print("Métodos de entrega"),
                      ),
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
