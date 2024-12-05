import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:aic_lll/core/models/global_controller_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class GlobalController extends GetxController {
  GlobalControllerModel userSession = GlobalControllerModel.empty();

  static const String _keyUserSession = 'user_session';

  Future<void> saveUserSession(Map<String, dynamic> session) async {
    userSession = userSession.copyWith(
      id: session["id"],
      accessToken: session["access_token"],
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserSession, jsonEncode(userSession.toMap()));
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserSession);
  }
}
