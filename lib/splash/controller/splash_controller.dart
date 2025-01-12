import 'package:aic_lll/app_env.dart';
import 'package:aic_lll/core/models/global_controller_model.dart';
import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/services/navigation_service.dart';
import 'package:aic_lll/core/widgets/custom_overlay.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final Dio _client = Dio();
  final baseUrl = AppEnv.baseUrl;

  @override
  void onInit() {
    asyncInit();
    super.onInit();
  }

  Future<GlobalControllerModel> getProfileInfo() async {
    try {
      final result = await _client.get(
        "$baseUrl/factories/${Get.find<GlobalController>().userSession.id}",
      );
      print(result.data);
      print(result.statusCode);
      if (result.statusCode == 200 || result.statusCode == 201) {
        CustomOverlay.success("Informações carregadas com sucesso!");
        await Get.find<GlobalController>().saveUserSession(result.data);
        return GlobalControllerModel.fromMap(result.data);
      } else {
        // Caso o status não seja 200 ou 201, pode retornar uma instância vazia ou algo mais informativo.
        CustomOverlay.error(
            "Erro ao carregar as informações. Status: ${result.statusCode}");
        return GlobalControllerModel.empty();
      }
    } on Exception catch (e) {
      // Captura de exceções genéricas (como erros de rede)
      CustomOverlay.error("Erro ao carregar as informações: $e");
      return GlobalControllerModel.empty();
    } catch (e) {
      // Captura de exceções imprevistas
      CustomOverlay.error("Erro desconhecido ao carregar as informações.");
      return GlobalControllerModel.empty();
    }
  }

  Future<void> asyncInit() async {
    await Future.delayed(const Duration(seconds: 3));
    final session = await Get.find<GlobalController>().getUserSession();

    getProfileInfo();
    print(session?.businessName);
    if (session != null) {
      NavigationService.pageToOffAllNamed(AppRoutes.homePageView);
    } else {
      NavigationService.pageToOffAllNamed(AppRoutes.welcome);
    }
  }
}
