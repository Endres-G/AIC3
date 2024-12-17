class Order {
  final String id;
  final String status;
  final String date;
  final String total;
  final int statusCode; // Código numérico para controle do status.

  Order({
    required this.id,
    required this.status,
    required this.date,
    required this.total,
    required this.statusCode,
  });
}
