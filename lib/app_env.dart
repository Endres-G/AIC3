import 'dart:convert';
import 'package:flutter/services.dart';

class AppEnv {
  static Map<String, dynamic>? _config;

  static Future<void> loadEnv() async {
    final jsonString = await rootBundle.loadString('.env/dev.json');
    _config = json.decode(jsonString) as Map<String, dynamic>;
  }

  static String get baseUrl {
    if (_config == null) {
      throw Exception(
          "Env não carregado. Certifique-se de chamar AppEnv.loadEnv() antes de acessar as variáveis.");
    }
    return _config!['BASEURL'] ?? '';
  }
}
