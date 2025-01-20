import 'dart:convert';

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
              : controller.products.isEmpty
                  ? const Center(child: Text("Nenhum produto encontrado"))
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final product = controller.products[index];
                        final firstVariation = product.variations.isNotEmpty
                            ? product.variations[0]
                            : null;
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: ListTile(
                            leading: firstVariation != null
                                ? Image.memory(
                                    base64Decode(firstVariation
                                        .image), // Supondo que a imagem seja codificada em base64
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons
                                    .image_not_supported), // Imagem do produto ou ícone de erro
                            title: Text(product.name),
                            subtitle: Text(product.description),
                            onTap: () {
                              print("a");
                              // Ação ao clicar no item (exemplo: navegar para detalhes)
                              // Get.toNamed(AppRoutes.productDetails, arguments: product);
                            },
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
