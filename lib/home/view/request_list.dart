import 'package:aic_lll/core/routes/app_routes.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:aic_lll/home/models/request_card_model.dart';
import 'package:aic_lll/home/view/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestList extends GetView<HomeController> {
  const RequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : RefreshIndicator(
                  onRefresh: () async {
                    await controller
                        .refreshRequests(); // Função para recarregar dados
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lista de pedidos",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(
                            () {
                              // Ordena os pedidos pelo ID antes de renderizar a lista
                              final sortedTransactions =
                                  controller.pendingTransactions.toList()
                                    ..sort((a, b) => a.id.compareTo(b.id));

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sortedTransactions.length,
                                itemBuilder: (context, index) {
                                  final request = sortedTransactions[index];
                                  return GestureDetector(
                                    onTap: () {
                                      print(
                                          "Detalhes do pedido ${request.id.toString()}");
                                      Get.toNamed(AppRoutes.pendingDetails,
                                          arguments: request.id);
                                    },
                                    child: RequestCard(
                                      requestCardModel: RequestCardModel(
                                        status: request.status,
                                        pendingDay: request.dateCreated,
                                        pendingId: request.id.toString(),
                                        client: request.buyerId.toString(),
                                        totalValue: request.totalValue,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
