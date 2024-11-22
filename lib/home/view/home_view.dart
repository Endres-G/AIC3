import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SafeArea(
            child: controller.isLoading.value
                ? const LoadingWidget()
                : SingleChildScrollView(
                    child: Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: controller.sendToProduct,
                            child: const Text("vai cadastrar produto"))
                      ],
                    ),
                  )))));
  }
}
