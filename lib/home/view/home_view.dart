import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:aic_lll/home/view/widgets/bar_chart.dart';
import 'package:aic_lll/home/view/widgets/last_week_sales_widget.dart';
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
              : const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, fulano",
                          style: TextStyle(
                            color: DesignSystemColors.titleTextfield,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Bem vindo de volta!",
                          style: TextStyle(
                            color: DesignSystemColors.textfieldInactiveColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [WeaklyDataWidget()],
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Column(
                              children: [
                                LastWeekSalesWidget(
                                  color: DesignSystemColors.orangeChartData,
                                  icon: Icon(
                                    Icons.monetization_on,
                                    size: 28,
                                  ),
                                  text: "Vendas da ultima semana",
                                  value: 12,
                                ),
                                SizedBox(height: 12),
                                LastWeekSalesWidget(
                                  color: DesignSystemColors.purpleChartData,
                                  icon: Icon(
                                    Icons.monetization_on,
                                    size: 28,
                                  ),
                                  text: "Receita da ultima semana",
                                  value: 512,
                                ),
                              ],
                            )
                          ],
                        )
                        // WeaklyDataWidget(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
