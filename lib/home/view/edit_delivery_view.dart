import 'package:aic_lll/core/models/global_controller_model.dart';
import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/custom_textfield.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDeliveryView extends GetView<HomeController> {
  const EditDeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Edite seus métodos de entrega",
                    style: TextStyle(
                      color: DesignSystemColors.primaryBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Selecione os métodos de entrega:",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 15),
                Obx(
                  () => Column(
                    children: controller.deliveryMethods.map((method) {
                      return CheckboxListTile(
                        title: Text(
                          method['name'] as String,
                          style: TextStyle(
                            color: controller.selectedDeliveryMethods
                                    .contains(method['id'])
                                ? DesignSystemColors.primaryBlue
                                : Colors.black,
                          ),
                        ),
                        value: controller.selectedDeliveryMethods
                            .contains(method['id']),
                        onChanged: (_) {
                          controller.toggleDeliveryMethod(method['id'] as int);
                        },
                        activeColor: DesignSystemColors.primaryBlue,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PrimaryButton(
                    onClick: () {
                      controller.updateDeliveryMethods();
                    },
                    text: "Salvar",
                    isGradient: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
