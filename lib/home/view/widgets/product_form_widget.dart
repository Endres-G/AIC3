import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/custom_textfield.dart';
import 'package:aic_lll/core/widgets/primary_button.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class ProductFormWidget extends StatelessWidget {
  const ProductFormWidget({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  // Função para abrir o seletor de cor
  void _openColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Escolha uma cor"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor:
                controller.selectedColor.value, // Cor atual do controlador
            onColorChanged: (color) {
              controller.selectedColor.value =
                  color; // Atualiza a cor no controlador
            },
            showLabel: true, // Exibe o código HEX
            pickerAreaHeightPercent: 0.8, // Tamanho da área de seleção de cor
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text("Confirmar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formProductKey =
        GlobalKey<FormState>(); // Chave global para o formulário do produto

    return SingleChildScrollView(
      child: Form(
        key: formProductKey,
        child: Column(
          children: [
            const Text(
              "Cadastre seu produto!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: DesignSystemColors.titleTextfield,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextfield(
              title: "Nome produto",
              hint: "Descrição do produto",
              controller: controller.productNameController,
            ),
            CustomTextfield(
              title: "Descrição do produto",
              hint: "Descrição do produto",
              controller: controller.productDiscriptionController,
            ),
            CustomTextfield(
              title: "Identificação da categoria",
              hint: "id",
              controller: controller.categoryIdController,
            ),
            CustomTextfield(
              title: "status",
              hint: "status",
              controller: controller.statusController,
            ),
            const SizedBox(height: 50),
            CustomTextfield(
              title: "Preço",
              hint: "Preço",
              controller: controller.priceController,
            ),
            CustomTextfield(
              title: "Nome da cor",
              hint: "Cor",
              controller: controller.colorNameController,
            ),
            const SizedBox(height: 5),
            PrimaryButton(
              onClick: () => _openColorPicker(context),
              text: "Escolha a cor",
              isGradient: false,
            ),
            Obx(() {
              return Text(
                'Cor escolhida: #${controller.selectedColor.value.value.toRadixString(16).padLeft(8, '0').toUpperCase().substring(2)}', // Exibe o código HEX da cor
                style: const TextStyle(fontSize: 16),
              );
            }),
            CustomTextfield(
              title: "Material do produto",
              hint: "Material",
              controller: controller.productMaterialController,
            ),
            CustomTextfield(
              title: "Largura do produto",
              hint: "Largura",
              controller: controller.productLengthController,
            ),
            CustomTextfield(
              title: "Comprimento do produto",
              hint: "Comprimento",
              controller: controller.productWidthController,
            ),
            CustomTextfield(
              title: "Altura do produto",
              hint: "Altura",
              controller: controller.productHeightController,
            ),
            CustomTextfield(
              title: "Estoque do produto",
              hint: "Estoque",
              controller: controller.productStockController,
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text("Escolha a imagem do produto"),
              onTap: () =>
                  controller.pickImage(isProfile: false, isProduct: true),
              trailing: Obx(() {
                if (controller.image.value == null) {
                  print("PARECE ERRADO");
                  return const SizedBox();
                }
                print("PARECE CERT");
                return controller.bytes.value != null
                    ? Image.memory(
                        controller.bytes.value!,
                        fit: BoxFit.cover,
                      )
                    : const SizedBox();
              }),
            ),
            PrimaryButton(
              onClick: () => controller.createProduct(),
              text: "ENVIAR",
              isGradient: false,
            ),
            // Seção de variações de produto (comentada anteriormente)
            const SizedBox(height: 20),
            // PrimaryButton(
            //   onClick: () => controller.addVariation(),
            //   text: "Adicionar variação",
            //   isGradient: false,
            // ),
          ],
        ),
      ),
    );
  }
}
