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
    final profileImage = Get.find<GlobalController>().userSession.profileImage;
    final businessName = Get.find<GlobalController>().userSession.businessName;
    final bannerImage = Get.find<GlobalController>()
        .userSession
        .coverImage; // Adicionando o banner

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        color: Colors.transparent,
                        elevation: 0,
                        child: BannerTile(
                          bannerImage: bannerImage,
                          profileImage: profileImage,
                          businessName: businessName ?? "Sem Nome",
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

class BannerTile extends StatelessWidget {
  final String? bannerImage;
  final String? profileImage;
  final String businessName;

  const BannerTile({
    Key? key,
    required this.bannerImage,
    required this.profileImage,
    required this.businessName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Imagem do banner
        if (bannerImage != null)
          Image.memory(
            base64Decode(bannerImage!),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.broken_image,
                size: 150,
              );
            },
          )
        else
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[300],
            child: const Icon(
              Icons.broken_image,
              size: 150,
              color: Colors.grey,
            ),
          ),

        // Imagem do perfil e nome do negócio
        ListTile(
          leading: profileImage != null
              ? ClipOval(
                  child: Image.memory(
                    base64Decode(profileImage!),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_not_supported_outlined,
                        size: 50,
                      );
                    },
                  ),
                )
              : const Icon(Icons.image_not_supported, size: 60),
          title: Text(
            businessName,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
