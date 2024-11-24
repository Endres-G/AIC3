import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Preenche toda a largura da tela
        height: double.infinity, // Preenche toda a altura da tela
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              DesignSystemColors.primaryBlue, // Azul primário
              DesignSystemColors.secundaryBlue, // Azul secundário
            ],
          ),
        ),
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            // color: Colors.brown, // Removido para deixar apenas a imagem
            child: Image.asset(
              'assets/images/splash_logo.png', // Substitua pelo caminho correto
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
