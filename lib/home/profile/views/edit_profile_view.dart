import 'package:aic_lll/core/models/global_controller_model.dart';
import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/custom_textfield.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView<HomeController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final formProfileKey =
        GlobalKey<FormState>(); // Chave global para o formulário

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Edite seu perfil",
                              style: TextStyle(
                                  color: DesignSystemColors.primaryBlue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: formProfileKey,
                          child: Column(
                            children: [
                              CustomTextfield(
                                title: "Nome da Empresa",
                                hint: "nome da empresa",
                                controller: controller.businessNameController,
                              ),
                              const SizedBox(height: 20),
                              // Imagem de Perfil
                              ListTile(
                                leading: const Icon(Icons.attach_file),
                                title:
                                    const Text("Escolha uma imagem de perfil"),
                                onTap: () => controller.pickImage(
                                    isProfile: true,
                                    isProduct:
                                        false), // Passando como argumento
                                trailing: Obx(() {
                                  if (controller.profileImage.value == null) {
                                    return const SizedBox();
                                  }
                                  return controller.profileImage.value != null
                                      ? Image.memory(
                                          controller.profileImage.value!,
                                          fit: BoxFit.cover,
                                        )
                                      : const SizedBox();
                                }),
                              ),
                              const SizedBox(height: 15),
                              // Imagem de Banner
                              ListTile(
                                leading: const Icon(Icons.attach_file),
                                title:
                                    const Text("Escolha uma imagem de banner"),
                                onTap: () => controller.pickImage(
                                    isProfile: false,
                                    isProduct:
                                        false), // Passando como argumento
                                trailing: Obx(() {
                                  if (controller.bannerImage.value == null) {
                                    return const SizedBox();
                                  }
                                  return controller.bannerImage.value != null
                                      ? Image.memory(
                                          controller.bannerImage.value!,
                                          fit: BoxFit.cover,
                                        )
                                      : const SizedBox();
                                }),
                              ),
                              const SizedBox(height: 30),
                              PrimaryButton(
                                  onClick: () => controller.patchProfile(
                                      GlobalControllerModel(
                                          businessName: controller
                                              .businessNameController.text,
                                          coverImage: controller
                                              .bannerImage.value
                                              .toString(),
                                          email:
                                              controller.emailController.text,
                                          profileImage: controller
                                              .profileImage.value
                                              .toString())),
                                  // print(GlobalControllerModel(
                                  //     id: Get.find<GlobalController>()
                                  //         .userSession
                                  //         .id,
                                  //     businessName: controller
                                  //         .businessNameController.text,
                                  //     coverImage: controller.bannerImage.value
                                  //         .toString(),
                                  //     email: controller.emailController.text,
                                  //     profileImage: controller
                                  //         .profileImage.value
                                  //         .toString())),
                                  text: "Enviar",
                                  isGradient: false),
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
