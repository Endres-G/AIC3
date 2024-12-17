import 'package:aic_lll/home/order_list/domain/entities/order_list_entity.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final Map<int, Color> statusColors = {
      0: Colors.blue,
      1: Colors.purple,
      2: Colors.pink,
      3: Colors.orange,
      4: Colors.green,
    };

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.id,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColors[order.statusCode]!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColors[order.statusCode]!),
                  ),
                  child: Text(
                    order.status,
                    style: TextStyle(
                        color: statusColors[order.statusCode]!,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('Cliente:\nMobio', style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 5),
            Text('Data do Pedido:\n${order.date}',
                style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 5),
            Text('Valor Total:\n${order.total}',
                style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
