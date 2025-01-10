import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  // Variáveis de controle
  Rx<bool> isLoading = false.obs;
  RxInt currentIndex = 0.obs; // Índice da página atual
  var selectedColor = Rx<Color>(Colors.blue);

  // Controladores de texto
  TextEditingController factoryIdController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDiscriptionController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colorNameController = TextEditingController();

  Rx<File?> image = Rx<File?>(null);
  Rx<String?> base64Image = Rx<String?>(null);
  Rx<Uint8List?> bytes = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  // Função para selecionar uma imagem
  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path); // Atualiza a imagem selecionada

      // Lê os bytes da imagem e converte para Base64
      List<int> imageBytes = File(pickedFile.path).readAsBytesSync();
      base64Image.value = base64Encode(imageBytes);
      debugPrint(base64Image.value); // Imprime o Base64

      // Converte Base64 para bytes para mostrar a imagem descodificada
      Uint8List decodedBytes = base64Decode(base64Image.value!);
      bytes.value = decodedBytes;
    }
  }

  // Função para limpar a imagem selecionada
  void clearImage() {
    image.value = null; // Limpa a imagem
  }

  // Função para sair da sessão e limpar os dados do usuário
  void exitMySession() {
    Get.find<GlobalController>().clearUserSession();
    Get.offAndToNamed(AppRoutes.welcome); // Navega para a tela de boas-vindas
  }

  // Função de placeholder para enviar produto
  void sendToProduct() {
    print("Vai para a página de registrar produto.");
  }
}
