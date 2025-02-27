import 'package:aic_lll/core/themes/app_assets.dart';
import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/global_controller.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:aic_lll/home/view/widgets/last_week_sales_widget.dart';
import 'package:aic_lll/home/view/widgets/pending_card.dart';
import 'package:aic_lll/home/view/widgets/weakly_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : RefreshIndicator(
                  onRefresh: () async {
                    print(controller.totalTransactionsValueForLast7Days);
                    await controller.getHomeData();
                    await controller.getPendingTransactions();
                  },
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 16),
                    children: [
                      Text(
                        "Olá, ${Get.find<GlobalController>().userSession.businessName}",
                        style: const TextStyle(
                          color: DesignSystemColors.titleTextfield,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Bem vindo de volta!",
                        style: TextStyle(
                          color: DesignSystemColors.textfieldInactiveColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Column(
                            children: [WeaklyDataWidget()],
                          ),
                          const SizedBox(width: 18),
                          Column(
                            children: [
                              LastWeekSalesWidget(
                                value: controller
                                    .totalTransactionsValueForLast7Days.value,
                                icon: AppAssets.lastWeekRecipe,
                                text: 'Receita da última Semana',
                                cardColor: DesignSystemColors.purpleChartData,
                                iconColor: DesignSystemColors.purpleChartIcon,
                              ),
                              const SizedBox(height: 12),
                              LastWeekSalesWidget(
                                value: controller
                                    .totalTransactionsCountForLast7Days.value,
                                icon: AppAssets.lastWeekSales,
                                text: 'Vendas da última Semana',
                                iconColor: DesignSystemColors.orangeChartIcon,
                                cardColor: DesignSystemColors.orangeChartData,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pedidos Pendentes",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                              Text(
                                "Ver Todos",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: DesignSystemColors.pendingCardText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Obx(() => ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    controller.pendingTransactions.length,
                                itemBuilder: (context, index) {
                                  final transaction =
                                      controller.pendingTransactions[index];
                                  return PendingCard(
                                    value: transaction.totalValue,
                                    id: transaction.id.toString(),
                                    time: transaction.dateCreated,
                                    title: 'Example Title',
                                  );
                                },
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
