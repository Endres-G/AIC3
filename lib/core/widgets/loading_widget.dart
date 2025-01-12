import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: DesignSystemColors.secundaryBlue,
        valueColor: AlwaysStoppedAnimation(
          Colors.blue,
        ),
      ),
    );
  }
}
