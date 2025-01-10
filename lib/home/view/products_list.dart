import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsList extends GetView<HomeController> {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 56, // Tamanho padrão do FAB
        width: 56, // Garantindo que altura e largura sejam iguais
        child: FloatingActionButton(
          backgroundColor: DesignSystemColors.secundaryBlue,
          onPressed: () => Get.toNamed(AppRoutes.createProduct),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(child: Center()),
        ),
      ),
    );
  }
}
