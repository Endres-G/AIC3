import 'package:aic_lll/core/widgets/custom_textfield.dart';
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

    return Form(
      key: formProductKey,
      child: Column(
        children: [
          CustomTextfield(
            title: "Identificação da fabrica",
            hint: "id",
            controller: controller.colorNameController,
          ),
          const SizedBox(height: 10),
          CustomTextfield(
            title: "Descrição do produto",
            hint: "Descrição do produto",
            controller: controller.colorNameController,
          ),
          CustomTextfield(
            title: "Identificação da categoria",
            hint: "id",
            controller: controller.colorNameController,
          ),
          CustomTextfield(
            title: "status",
            hint: "status",
            controller: controller.colorNameController,
          ),
          const SizedBox(height: 150),
          CustomTextfield(
            title: "preço",
            hint: "preço",
            controller: controller.colorNameController,
          ),
          CustomTextfield(
            title: "Nome da cor",
            hint: "cor",
            controller: controller.colorNameController,
          ),
          ElevatedButton(
            onPressed: () => _openColorPicker(context), // Abre o seletor de cor
            child: const Text("Escolha a cor"),
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
          ListTile(
            leading: const Icon(Icons.attach_file),
            title: const Text("Escolha a imagem do produto"),
            onTap: () => controller.pickImage(),
            trailing: Obx(() {
              if (controller.image.value == null) {
                return const SizedBox();
              }
              return controller.bytes.value != null
                  ? Image.memory(
                      controller.bytes.value!,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox();
            }),
          ),
        ],
      ),
    );
  }
}
