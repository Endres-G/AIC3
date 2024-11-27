import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/home/view/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

class WeaklyDataWidget extends StatelessWidget {
  const WeaklyDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      width: 171,
      height: 254,
      decoration: BoxDecoration(
        color: DesignSystemColors.greenChart,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        children: [
          BarChartWidget(),
          Text(
            "Vendas",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                fontFamily: "Alexandria",
                color: DesignSystemColors.titleTextfield),
          ),
          Text(
            "da semana",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: "Alexandria",
                color: DesignSystemColors.chartText),
          ),
        ],
      ),
    );
  }
}
