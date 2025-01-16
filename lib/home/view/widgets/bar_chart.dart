import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarChartWidget extends StatelessWidget {
  BarChartWidget({
    super.key,
  });
  final controllerList =
      Get.find<HomeController>().transactionsCountForLast7Days;
  @override
  Widget build(BuildContext context) {
    final days = _getDaysForLast7Days();
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        color: DesignSystemColors.greenChart,
        child: BarChart(
          BarChartData(
            barGroups: List.generate(7, (index) {
              // Verifica se a lista tem dados suficientes
              double value = index < controllerList.length
                  ? controllerList[index].toDouble()
                  : 0.0; // Se não houver dados, atribui 0

              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: value,
                    width: 15,
                    color: DesignSystemColors.greenChartData,
                  ),
                ],
              );
            }),
            alignment: BarChartAlignment.spaceEvenly,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    if (value < 0 || value > 6) return Container();
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        days[value.toInt()],
                        style: const TextStyle(
                          fontSize: 8,
                          color: DesignSystemColors.textfieldInactiveColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

// Função para gerar os dias da semana com base no dia atual
  List<String> _getDaysForLast7Days() {
    final today = DateTime.now(); // Pega o dia atual
    final daysOfWeek = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];

    // Gera os últimos 7 dias dinamicamente
    List<String> days = [];
    for (int i = 6; i >= 0; i--) {
      final day = today.subtract(Duration(days: i)); // Subtrai os dias
      days.add(daysOfWeek[day.weekday - 1]); // Ajusta índice para 0 a 6
    }

    return days;
  }
}
