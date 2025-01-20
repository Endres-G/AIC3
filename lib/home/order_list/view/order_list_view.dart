import 'package:aic_lll/home/order_list/controller/order_list_controller.dart';
import 'package:aic_lll/home/order_list/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OrderListView extends GetView<OrderListController> {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = controller.loadOrders();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Pedidos',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderCard(order: order);
        },
      ),
    );
  }
}
