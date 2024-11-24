import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';

class WelcomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? child;

  const WelcomeAppbar({
    super.key,
    this.height = 350,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior:
          Clip.none, // Importante: permite que o conteúdo saia do container
      child: Stack(
        clipBehavior:
            Clip.none, // Importante: permite que os elementos saiam do Stack
        children: [
          Positioned(
            top: -height - 90, // Move o círculo para cima
            left: -100, // Expande para os lados
            right: -100,
            child: Container(
              height: height * 2, // Altura total do círculo
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft, // Ajuste para visibilidade
                  end: Alignment.bottomRight,
                  colors: [
                    DesignSystemColors.primaryBlue,
                    DesignSystemColors.secundaryBlue,
                  ],
                ),
                shape: BoxShape
                    .circle, // Usa shape circle ao invés de borderRadius
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 261,
                    height: 92,
                    margin: const EdgeInsets.symmetric(horizontal: 66),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/mobio_logo.png',
                        fit: BoxFit
                            .cover, // Garante que a imagem preencha o container
                      ),
                    ),
                  ),
                  const Text(
                    'FÁBRICAS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
