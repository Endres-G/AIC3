import 'package:aic_lll/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  final int id;
  final String cliente;

  const OrderCard({
    super.key,
    required this.cliente,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    void changeStatus(String newValue) {
      // Verifica se o status não é 'delivered' (concluído)
      if (newValue == "delivered") {
        return; // Não permite mudar para "concluído"
      }
      controller.changeStatus(id, newValue);
      // Imprime o status em inglês no terminal
      print("Status alterado para: $newValue");
      print(newValue);
      // Atualiza o status no controlador
      controller.pendingDetail.value?.status = newValue;
    }

    return FutureBuilder(
      future: controller.getDetailsPendingData(id), // Chama a função assíncrona
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Enquanto estiver carregando, exibe um carregamento
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Se ocorrer um erro
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          // Se os dados forem carregados com sucesso
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
                          "Pedido #${id}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DropdownButton<String>(
                        value: controller.pendingDetail.value?.status ??
                            "pending", // Valor padrão
                        icon: const Icon(Icons.keyboard_arrow_down),
                        underline: const SizedBox(),
                        items: [
                          "pending",
                          "manufacturing",
                          "awaitingCollection",
                          "sent",
                          "delivered"
                        ].map((String value) {
                          // Mapeia os valores em inglês para os valores em português
                          String displayValue;
                          IconData icon;
                          Color iconColor;

                          switch (value) {
                            case "pending":
                              displayValue = "Pendente";
                              icon = Icons.access_time;
                              iconColor = Colors.blue;
                              break;
                            case "manufacturing":
                              displayValue = "Em Produção";
                              icon = Icons.build;
                              iconColor = Colors.blueAccent;
                              break;
                            case "awaitingCollection":
                              displayValue = "Aguardando Coleta";
                              icon = Icons.access_alarm;
                              iconColor = Colors.purple;
                              break;
                            case "sent":
                              displayValue = "Enviado";
                              icon = Icons.local_shipping;
                              iconColor = Colors.orange;
                              break;
                            case "delivered":
                              displayValue = "Entregue";
                              icon = Icons.check_circle;
                              iconColor = Colors.green;
                              break;
                            default:
                              displayValue = "Pendente";
                              icon = Icons.access_time;
                              iconColor = Colors.orange;
                              break;
                          }

                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Icon(icon, color: iconColor),
                                const SizedBox(width: 8),
                                Text(
                                    displayValue), // Exibe o valor em português
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Chama a função que muda o status e imprime o valor no terminal
                          if (newValue != "delivered") {
                            changeStatus(newValue ?? "pending");
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text("Cliente: ${cliente}", overflow: TextOverflow.ellipsis),
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
                        final produto =
                            controller.pendingDetail.value?.items[index];
                        return Container(
                          margin: const EdgeInsets.only(
                              bottom: 8, left: 50, right: 50),
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
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
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
        } else {
          return const Center(child: Text('Nenhum dado encontrado.'));
        }
      },
    );
  }
}
