import 'package:aic_lll/core/themes/design_system.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        color: DesignSystemColors.greenChart, // Cor de fundo do gráfico
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                      toY: 1,
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
                      toY: 50,
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
                      toY: 10,
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
                      toY: 23,
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
                      toY: 54,
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
                      toY: 100,
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
                      toY: 78,
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
                    const days = [
                      'Dom',
                      'Seg',
                      'Ter',
                      'Qua',
                      'Qui',
                      'Sex',
                      'Sáb',
                    ];
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
}
