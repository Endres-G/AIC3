import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onClick,
    required this.text,
    required this.isGradient,
  });

  final String text;
  final bool isGradient;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: Colors.white,
      onPressed: onClick,
      child: Container(
        width: 253,
        height: 58,
        decoration: BoxDecoration(
          gradient: isGradient
              ? const LinearGradient(
                  colors: [
                    DesignSystemColors.primaryBlue,
                    DesignSystemColors.secundaryBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: !isGradient ? DesignSystemColors.primaryBlue : null,
          borderRadius: BorderRadius.circular(12), // Arredondamento das bordas
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
