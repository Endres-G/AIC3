import 'package:aic_lll/home/order_list/domain/entities/order_list_entity.dart';

class OrderListController {
  // Simula uma lista de pedidos vindos de uma fonte de dados.
  List<Order> loadOrders() {
    return [
      Order(
          id: '0000001',
          status: 'Pendente',
          date: '27/11/2024',
          total: 'R\$ 489,75',
          statusCode: 0),
      Order(
          id: '0000002',
          status: 'Em fabricação',
          date: '27/11/2024',
          total: 'R\$ 489,75',
          statusCode: 1),
      Order(
          id: '0000003',
          status: 'Aguardando coleta',
          date: '27/11/2024',
          total: 'R\$ 489,75',
          statusCode: 2),
      Order(
          id: '0000004',
          status: 'Enviado',
          date: '27/11/2024',
          total: 'R\$ 489,75',
          statusCode: 3),
      Order(
          id: '0000005',
          status: 'Entregue',
          date: '27/11/2024',
          total: 'R\$ 489,75',
          statusCode: 4),
    ];
  }
}
