import 'package:aic_lll/core/widgets/loading_widget.dart';
import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:aic_lll/home/models/pending_details_model.dart';

class PendingDetailsView extends GetView<HomeController> {
  const PendingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.isLoading.value
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detalhes do pedido",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Exibindo dados do pedido
                        _buildOrderDetailSection(
                            controller.pendingDetails.value),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildOrderDetailSection(PendingDetailsModel details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Data do pedido
        _buildRow("Data do Pedido", _formatDate(details.dateCreated)),
        const SizedBox(height: 8),

        // Produtos listados
        _buildRow("Produtos", _buildProductList(details.items)),
        const SizedBox(height: 8),

        // Valor total
        _buildRow("Valor Total", details.totalValue),
        const SizedBox(height: 8),

        // Cliente
        _buildRow(
            "Cliente",
            details
                .paymentMethod.name), // Exemplo de exibição, pode ser ajustado
        const SizedBox(height: 8),

        // Dropdown para alterar status
        _buildStatusDropdown(details),
      ],
    );
  }

  // Método para formatar a data
  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Método para construir a lista de produtos
  String _buildProductList(List<TransactionItem> items) {
    return items
        .map((item) =>
            "Produto: ${item.productVariationId} - Quantidade: ${item.quantity}")
        .join('\n');
  }

  // Função para criar as linhas de detalhes
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

  // Função para construir o dropdown de status
  Widget _buildStatusDropdown(PendingDetailsModel details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Alterar Status", style: TextStyle(fontSize: 16)),
        DropdownButton<String>(
          value: details.status,
          onChanged: (newStatus) {
            // Lógica para atualizar o status
            // controller.updateStatus(newStatus);
          },
          items: [
            "Pending",
            "Manufacturing",
            "Awaiting Collection",
            "Sent",
            "Delivered",
          ].map<DropdownMenuItem<String>>((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(status),
            );
          }).toList(),
        ),
      ],
    );
  }
}
