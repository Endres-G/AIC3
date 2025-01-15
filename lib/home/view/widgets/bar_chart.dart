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
    print(controllerList);

    final days = _getDaysForLast7Days();
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        color: DesignSystemColors.greenChart,
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[0].toDouble(),
                      width: 15, // Aumenta a largura da barra
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra

                      ),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[1].toDouble(),
                      width: 15, // Aumenta a largura da barra
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra

                      ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[2].toDouble(),
                      width: 15,
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra
// Aumenta a largura da barra
                      ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[3].toDouble(),
                      width: 15,
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra
// Aumenta a largura da barra
                      ),
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[4].toDouble(),
                      width: 15,
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra
// Aumenta a largura da barra
                      ),
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[5].toDouble(),
                      width: 15,
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra
                      // Aumenta a largura da barra
                      ),
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                      toY: controllerList[6].toDouble(),
                      width: 15,
                      color: DesignSystemColors
                          .greenChartData // Aumenta a largura da barra
                      ),
                ],
              ),
            ],
            alignment:
                BarChartAlignment.spaceEvenly, // Centraliza e espaça as barras
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30, // Espaço para os títulos no eixo X
                  getTitlesWidget: (value, meta) {
                    days;
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
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Remove os títulos do eixo Y
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Remove os títulos do eixo superior
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false, // Remove os títulos do eixo direito
                ),
              ),
            ),
            gridData: const FlGridData(
              show: false,
            ), // Esconde a malha cartesiana
            borderData: FlBorderData(
              show: false,
            ), // Esconde as bordas
            backgroundColor:
                Colors.transparent, // Fundo transparente do gráfico
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
