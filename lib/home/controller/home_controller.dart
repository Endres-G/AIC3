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

  TextEditingController cnpjController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Rx<String?> base64ProfileImage = Rx<String?>(null);
  Rx<String?> base64BannerImage = Rx<String?>(null);
  Rx<String?> base64ProductImage = Rx<String?>(null);

  Rx<File?> image = Rx<File?>(null);
  Rx<String?> base64Image = Rx<String?>(null);
  Rx<Uint8List?> bytesProfileImg = Rx<Uint8List?>(null);
  Rx<Uint8List?> bytesBannerImg = Rx<Uint8List?>(null);
  Rx<Uint8List?> bytes = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    if (products.isEmpty) {
      fetchProducts();
    }
  }

  Rx<Uint8List?> profileImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> bannerImage = Rx<Uint8List?>(null);
  Rx<Uint8List?> productImage = Rx<Uint8List?>(null);

  // Função para selecionar uma imagem
  Future<void> pickImage(
      {required bool isProfile, required bool isProduct}) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      List<int> imageBytes = File(pickedFile.path).readAsBytesSync();

      // Atualiza as imagens dependendo do tipo selecionado
      if (isProfile && !isProduct) {
        base64ProfileImage.value = base64Encode(imageBytes);
        Uint8List decodedBytes = base64Decode(base64ProfileImage.value!);

        profileImage.value = decodedBytes;
      } else if (!isProfile && !isProduct) {
        base64BannerImage.value = base64Encode(imageBytes);
        Uint8List decodedBytes = base64Decode(base64BannerImage.value!);
        bannerImage.value = decodedBytes;
      } else if (isProduct) {
        print("CHEGUE ONDE DEVIA");
        base64ProductImage.value = base64Encode(imageBytes);
        Uint8List decodedBytes = base64Decode(base64ProductImage.value!);
        productImage.value = decodedBytes;
        bytes.value = decodedBytes;
      }

      // Atualiza a imagem selecionada
      image.value = File(pickedFile.path);
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
          factoryId: Get.find<GlobalController>().userSession.id!,
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
              image: base64ProductImage.value ?? "",
              productId: null,
            )
          ],
        ).toJson(),
      );

      if (result.statusCode == 200 || result.statusCode == 201) {
        CustomOverlay.success("Produto cadastrado!");

        // Adiciona o produto recém-criado à lista de produtos
        final newProduct = ProductModel.fromJson(result.data);
        products.add(newProduct); // Adiciona o produto à lista

        clearForm(); // Limpa os campos do formulário
        Get.back(); // Volta para a tela anterior
      }
    } on Exception catch (e) {
      CustomOverlay.error("Erro ao cadastrar produto!");
    }
  }

  Future<void> fetchProducts() async {
    try {
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

  Future<void> patchProfile(GlobalControllerModel model) async {
    try {
      final dataToSend = model
          .copyWith(
            id: Get.find<GlobalController>().userSession.id,
            profileImage: base64ProfileImage.value ?? model.profileImage,
            coverImage: base64BannerImage.value ?? model.coverImage,
          )
          .toMapForApi();

      print("TAMO NO PATCH");

      final result = await _client.patch(
        "$baseUrl/factories/${Get.find<GlobalController>().userSession.id}",
        data: dataToSend,
      );

      if (result.statusCode == 200 || result.statusCode == 201) {
        CustomOverlay.success("editado!!");

        final updatedModel = GlobalControllerModel.fromMap(result.data);

        final currentUser = Get.find<GlobalController>().userSession;
        final updatedUser = currentUser.copyWith(
          id: currentUser.id, // Garante que o ID esteja definido
          businessName: updatedModel.businessName,
          email: updatedModel.email,
          profileImage: updatedModel.profileImage,
          coverImage: updatedModel.coverImage,
        );

        print('Dados do usuário atualizados: ${updatedUser.toMapForSession()}');

        await Get.find<GlobalController>()
            .saveUserSession(updatedUser.toMapForSession());
        Get.offAndToNamed(AppRoutes.splash);
      }
    } on Exception catch (e) {
      CustomOverlay.error("Erro ao cadastrar produto!");
    }
  }

  // Lista fixa de métodos de pagamento
  final paymentMethods = [
    {"id": 1, "name": "Boleto Bancário"},
    {"id": 2, "name": "Cartão de Crédito"},
    {"id": 3, "name": "Pix"},
    {"id": 4, "name": "Transferência Bancária"},
  ];

  var selectedPaymentMethods = <int>[].obs; // IDs dos métodos selecionados

  // Alterna a seleção de um método de pagamento
  void togglePaymentMethod(int id) {
    if (selectedPaymentMethods.contains(id)) {
      selectedPaymentMethods.remove(id);
    } else {
      selectedPaymentMethods.add(id);
    }
  }

  // Atualiza os métodos de pagamento
  Future<void> updatePaymentMethods() async {
    try {
      final body = {"paymentMethodIds": selectedPaymentMethods};
      // Substitua por sua chamada real de API
      final response = await _client.patch(
        '$baseUrl/factories/${Get.find<GlobalController>().userSession.id}/update-payment-methods',
        data: body,
      );
      print(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        CustomOverlay.success("Atualizado");
        Get.back();
      }
      CustomOverlay.success("Atualizado");
    } catch (e) {
      CustomOverlay.error("Erro");
    }
  }

  // Lista de métodos de entrega fixos
  final deliveryMethods = const [
    {"id": 1, "name": "Entrega Própria"},
    {"id": 2, "name": "Transportadora"},
    {"id": 3, "name": "Retirada no Local"},
    {"id": 4, "name": "Correios"},
  ];

  // Lista de IDs dos métodos de entrega selecionados
  var selectedDeliveryMethods = <int>[].obs;

  // Função para alternar seleção
  void toggleDeliveryMethod(int id) {
    if (selectedDeliveryMethods.contains(id)) {
      selectedDeliveryMethods.remove(id);
    } else {
      selectedDeliveryMethods.add(id);
    }
  }

  // Atualiza os métodos de pagamento
  Future<void> updateDeliveryMethods() async {
    try {
      final body = {"deliveryMethodIds": selectedDeliveryMethods};
      // Substitua por sua chamada real de API
      final response = await _client.patch(
        '$baseUrl/factories/${Get.find<GlobalController>().userSession.id}/update-delivery-methods',
        data: body,
      );
      print(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        CustomOverlay.success("Atualizado");
        Get.back();
      }
      CustomOverlay.success("Atualizado");
    } catch (e) {
      CustomOverlay.error("Erro");
    }
  }
}
