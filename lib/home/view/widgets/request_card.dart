import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/home/models/request_card_model.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    required this.requestCardModel,
  });

  final RequestCardModel requestCardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DesignSystemColors.pendingCard,
        borderRadius: BorderRadius.circular(12), // Bordas arredondadas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinha o texto à esquerda
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                requestCardModel.pendingId, // Exibe o ID do pedido
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                ),
                child: Text(
                  requestCardModel
                      .formattedPendingDay, // Exibe a data formatada
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildRow("Cliente", requestCardModel.client),
          const SizedBox(
            height: 2,
          ),
          _buildRow("Data do pedido", requestCardModel.formattedPendingDay),
          const SizedBox(
            height: 2,
          ), // Exibe a data do pedido
          _buildRow("Valor total", requestCardModel.formattedTotalValue),
          const SizedBox(
            height: 2,
          ), // Exibe o valor total formatado
        ],
      ),
    );
  }

  // Função auxiliar para criar as linhas de forma mais organizada
  Widget _buildRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
