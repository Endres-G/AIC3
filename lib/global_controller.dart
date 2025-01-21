import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:aic_lll/core/models/global_controller_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GlobalController extends GetxController {
  GlobalControllerModel userSession = GlobalControllerModel.empty();

  static const String _keyUserSession = 'user_session';

  Future<void> saveUserSession(Map<String, dynamic> session) async {
    try {
      print('Mapa recebido pelo saveUserSession: $session');

      userSession = userSession.copyWith(
        id: session["id"] ?? userSession.id,
        businessName: session["businessName"] ?? userSession.businessName,
        email: session["email"] ?? userSession.email,
        profileImage: session["profileImage"] ?? userSession.profileImage,
        coverImage: session["coverImage"] ?? userSession.coverImage,
      );

      print('Salvando sessão: ${userSession.toMapForSession()}');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          _keyUserSession, jsonEncode(userSession.toMapForSession()));
    } catch (e) {
      print('Erro ao salvar sessão: $e');
    }
  }

  Future<GlobalControllerModel?> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyUserSession);

    if (jsonString != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      userSession = GlobalControllerModel.fromMap(jsonMap);
      return GlobalControllerModel.fromMap(jsonMap);
    }
    return null;
  }

  Future<void> clearUserSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Remove apenas os dados da sessão do cache
      await prefs.remove(_keyUserSession);

      // Reseta o modelo de sessão em memória para o estado vazio
      userSession = GlobalControllerModel.empty();

      print('Sessão do usuário limpa com sucesso.');
    } catch (e) {
      print('Erro ao limpar a sessão do usuário: $e');
    }
  }
}
