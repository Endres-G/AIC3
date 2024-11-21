import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/products/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Obx(() => SafeArea(
            child: controller.isLoading.value
                ? const LoadingWidget()
                : SingleChildScrollView(
                    child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text("AQUI VAMO MANDAR A REQ DE CRIAR PRODUTO"),
                          TextFormField()
                        ],
                      ),
                    ),
                  )))));
  }
}
