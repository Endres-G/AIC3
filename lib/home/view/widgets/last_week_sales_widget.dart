import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastWeekSalesWidget extends StatelessWidget {
  const LastWeekSalesWidget({
    super.key,
    required this.value,
    required this.icon,
    required this.text,
    required this.color,
  });

  final int value;
  final Icon icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      width: 170,
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(
            height: 12,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              color: DesignSystemColors.simpleChart,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            text.contains("Receita")
                ? NumberFormat.currency(
                    locale: 'pt_BR',
                    symbol: 'R\$',
                  ).format(value)
                : value.toString(),
          )
        ],
      ),
    );
  }
}
