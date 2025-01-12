import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:aic_lll/app_env.dart';
import 'package:aic_lll/core/models/global_controller_model.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/custom_overlay.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:aic_lll/home/products/models/create_product_model.dart';
import 'package:aic_lll/home/products/models/product_variation_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final Dio _client = Dio();
  final baseUrl = AppEnv.baseUrl;
  // Variáveis de controle
  Rx<bool> isLoading = false.obs;
  RxInt currentIndex = 0.obs; // Índice da página atual
  var selectedColor = Rx<Color>(Colors.blue);
  Rx<bool> isFetched = false.obs; // Flag para evitar múltiplas requisições

  RxList<ProductModel> products = <ProductModel>[].obs;

  TextEditingController productDiscriptionController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colorNameController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();

  TextEditingController productMaterialController = TextEditingController();
  TextEditingController productLengthController = TextEditingController();
  TextEditingController productWidthController = TextEditingController();
  TextEditingController productHeightController = TextEditingController();
  TextEditingController productStockController = TextEditingController();

  Rx<File?> image = Rx<File?>(null);
  Rx<String?> base64Image = Rx<String?>(null);
  Rx<Uint8List?> bytes = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    // Observa mudanças no índice da página
    ever(currentIndex, (int index) {
      if (index == 2 && !isFetched.value) {
        fetchProducts();
      }
    });
  }

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

  void clearForm() {
    productDiscriptionController.clear();
    productNameController.clear();
    statusController.clear();
    priceController.clear();
    colorNameController.clear();
    categoryIdController.clear();
    productMaterialController.clear();
    productLengthController.clear();
    productWidthController.clear();
    productHeightController.clear();
    productStockController.clear();
    clearImage();
  }

  void clearImage() {
    image.value = null; // Limpa a imagem
  }

  void exitMySession() {
    Get.find<GlobalController>().clearUserSession();
    Get.offAndToNamed(AppRoutes.welcome); // Navega para a tela de boas-vindas
  }

  Future<void> createProduct() async {
    try {
      final result = await _client.post(
        "$baseUrl/factories/products",
        data: ProductModel(
          factoryId: Get.find<GlobalController>().userSession.id,
          name: productNameController.text,
          description: productDiscriptionController.text,
          categoryId: int.parse(categoryIdController.text.trim()),
          status: statusController.text,
          variations: [
            ProductVariationModel(
              price: double.parse(priceController.text),
              colorName: colorNameController.text,
              colorHexCode: selectedColor.value.toString(),
              material: productMaterialController.text,
              length: double.parse(productLengthController.text),
              width: double.parse(productWidthController.text),
              height: double.parse(productHeightController.text),
              stock: int.parse(productStockController.text),
              image: base64Image.value ?? "",
              productId: null,
            )
          ],
        ).toJson(),
      );

      if (result.statusCode == 200 || result.statusCode == 201) {
        CustomOverlay.success("cadastrado!!");
        clearForm();
        Get.back();
      }
    } on Exception catch (e) {
      CustomOverlay.error("Erro cadastrar produto!");
    }
  }

  Future<void> fetchProducts() async {
    try {
      print(products);
      isLoading.value = true;
      // Buscando a lista de produtos e armazenando no controlador
      final productList = await getProducts();
      products.assignAll(productList);
      isFetched.value = true; // Marca como carregado
    } catch (e) {
      print('Erro ao carregar produtos: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getProducts() async {
    try {
      final result = await _client.get(
        "$baseUrl/factories/${Get.find<GlobalController>().userSession.id}/products",
      );
      if (result.statusCode == 200 || result.statusCode == 201) {
        CustomOverlay.success("Produtos carregados!");
        print(result.data);
        // Ajustando para retornar uma lista de produtos
        return (result.data as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
      }
    } on Exception catch (e) {
      CustomOverlay.error("Erro ao carregar produto!");
      print("Erro: $e");
    }
    // Retornando lista vazia caso algo dê errado
    return [];
  }
}
