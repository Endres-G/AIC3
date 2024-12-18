import 'package:aic_lll/core/themes/app_assets.dart';
import 'package:aic_lll/core/themes/design_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Adicione este import para manipulação de datas e horas

class PendingCard extends StatelessWidget {
  const PendingCard({
    super.key,
    required this.value,
    required this.id,
    required this.time, // Agora time é DateTime
    required this.title,
  });

  final String title;
  final int value;
  final String id;
  final DateTime time; // Altere aqui para DateTime

  @override
  Widget build(BuildContext context) {
    // Formatar o horário com AM/PM
    String formattedTime =
        DateFormat('hh:mm a').format(time); // Formata para 12 horas com AM/PM

    // Formatar valor com R$
    String formattedValue = "R\$ $value"; // Exibindo R$ no lugar de RS

    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.center, // Garante o alinhamento central do Row
      children: [
        // Logo centralizado verticalmente dentro de um Container
        Container(
          height: 50,
          width: 40,
          alignment:
              Alignment.bottomCenter, // Alinha o logo no centro verticalmente
          child: SizedBox(
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppAssets.iconLogo,
                fit: BoxFit.cover, // Garante que a imagem preencha o espaço
              ),
            ),
          ),
        ),
        const SizedBox(width: 8), // Espaço entre o logo e o texto
        // Usando Expanded para permitir que o Container se ajuste dinamicamente
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinha o texto à esquerda
            children: [
              // Linha acima do conteúdo de texto
              const Divider(
                color: Colors.grey, // Cor da linha (cinza)
                thickness: 1, // Espessura da linha
                indent: 0, // Indenta a linha para alinhar com o conteúdo
                endIndent: 0, // Indenta a linha do outro lado
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      formattedValue, // Exibindo valor com o símbolo R$
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ID $id",
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: DesignSystemColors.pendingCardText),
                    ),
                    Text(
                      formattedTime, // Hora formatada com AM/PM
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: DesignSystemColors.pendingCardText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
