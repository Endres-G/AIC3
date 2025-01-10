import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:aic_lll/home/view/widgets/product_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProduct extends GetView<HomeController> {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                        ProductFormWidget(
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
