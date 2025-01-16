import 'package:aic_lll/core/themes/design_system.dart';
import 'package:aic_lll/home/models/request_card_model.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    required this.requestCardModel,
  });

  final RequestCardModel requestCardModel;
  //toDo mudar o nome do status para ingles
  // Método para obter a cor das bordas e do texto do status com base no status
  Color _getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.blue;
      case "Em fabricação":
        return Colors.blueAccent;
      case "Aguardando coleta":
        return Colors.purple;
      case "Enviado":
        return Colors.orange;
      case "Entregue":
        return Colors.green;
      default:
        return Colors.grey; // Cor padrão para status desconhecido
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(requestCardModel.status);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: DesignSystemColors.pendingCard, // Cor original do card
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: DesignSystemColors
                        .pendingCard, // Fundo igual ao do card principal
                    border: Border.all(
                      color: statusColor, // Cor das bordas dinâmica
                    ),
                    borderRadius:
                        BorderRadius.circular(20), // Bordas arredondadas
                  ),
                  child: Text(
                    requestCardModel.status, // Exibe o status
                    style: TextStyle(
                      fontSize: 14,
                      color: statusColor, // Cor do texto dinâmica
                      fontWeight: FontWeight.bold,
                    ),
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
