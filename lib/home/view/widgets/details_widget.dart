import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatefulWidget {
  final int id;
  final String cliente;
  final String data;
  final List<Map<String, dynamic>> produtos;
  final String tipoEntrega;
  final String tipoPagamento;
  final double valorTotal;

  const OrderCard({
    super.key,
    required this.cliente,
    required this.data,
    required this.produtos,
    required this.tipoEntrega,
    required this.tipoPagamento,
    required this.valorTotal,
    required this.id,
  });

  @override
  OrderCardState createState() => OrderCardState();
}

class OrderCardState extends State<OrderCard> {
  final controller = Get.find<HomeController>();

  // void _updateStatus(String? newValue) {
  //   if (newValue == "Concluído") {
  //     return;
  //   }
  //   setState(() {
  //     controller.pendingDetail.value? = newValue ?? "Pendente";
  //   });
  // }

  // Função assíncrona para buscar os dados
  Future<void> _loadData() async {
    await controller
        .getDetailsPendingData(widget.id); // Espera a requisição ser concluída
    setState(() {
      controller.isLoading.value = false; // Dados carregados, atualiza o estado
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // Chama a função assíncrona
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Pedido #${widget.id}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DropdownButton<String>(
                  value: controller.pendingDetail.value?.status,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: const SizedBox(),
                  items: [
                    "Pending",
                    "Em Separação",
                    "Enviando",
                    "Concluído",
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(
                            value == "Pendente"
                                ? Icons.access_time
                                : value == "Em Separação"
                                    ? Icons.inventory
                                    : value == "Enviando"
                                        ? Icons.local_shipping
                                        : Icons.check_circle,
                            color: value == "Concluído"
                                ? Colors.green
                                : Colors.blue,
                          ),
                          const SizedBox(width: 8),
                          Text(value),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: _updateStatus,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("Cliente: ${widget.cliente}", overflow: TextOverflow.ellipsis),
            Text("Data: ${controller.pendingDetail.value?.dateCreated}",
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            const Text(
              "Produtos:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 150, // Limite de altura
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.pendingDetail.value?.items.length,
                itemBuilder: (context, index) {
                  final produto = controller.pendingDetail.value?.items[index];
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 8, left: 50, right: 50),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Text(
                            produto!.id.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text("Qtd: ${produto.quantity}"),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            // Outros detalhes
            Text(
                "Tipo de Entrega: ${controller.pendingDetail.value?.deliveryMethod.name}",
                overflow: TextOverflow.ellipsis),
            Text(
                "Tipo de Pagamento: ${controller.pendingDetail.value?.paymentMethod.name}",
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            // Total
            Text(
              "Total: R\$ ${controller.pendingDetail.value?.totalValue}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
