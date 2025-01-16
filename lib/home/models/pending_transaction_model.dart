class PendingTransactionModel {
  final int id;
  final int sellerId;
  final int buyerId;
  final DateTime dateCreated;
  final String status;
  final double totalValue;
  final int paymentMethodId;
  final int deliveryMethodId;

  PendingTransactionModel({
    required this.id,
    required this.sellerId,
    required this.buyerId,
    required this.dateCreated,
    required this.status,
    required this.totalValue,
    required this.paymentMethodId,
    required this.deliveryMethodId,
  });

  // Método para converter JSON para PendingTransactionModel
  factory PendingTransactionModel.fromJson(Map<String, dynamic> json) {
    return PendingTransactionModel(
      id: json['id'],
      sellerId: json['sellerId'],
      buyerId: json['buyerId'],
      dateCreated: DateTime.parse(json['dateCreated']),
      status: json['status'],
      totalValue: double.parse(json['totalValue']),
      paymentMethodId: json['paymentMethodId'],
      deliveryMethodId: json['deliveryMethodId'],
    );
  }

  // Método para converter PendingTransactionModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellerId': sellerId,
      'buyerId': buyerId,
      'dateCreated': dateCreated.toIso8601String(),
      'status': status,
      'totalValue': totalValue.toString(),
      'paymentMethodId': paymentMethodId,
      'deliveryMethodId': deliveryMethodId,
    };
  }

  factory PendingTransactionModel.empty() {
    return PendingTransactionModel(
      id: 0,
      sellerId: 0,
      buyerId: 0,
      dateCreated: DateTime.now(),
      status: '',
      totalValue: 0.0,
      paymentMethodId: 0,
      deliveryMethodId: 0,
    );
  }
  @override
  String toString() {
    return 'PendingTransactionModel(id: $id, sellerId: $sellerId, buyerId: $buyerId, dateCreated: $dateCreated, status: $status, totalValue: $totalValue, paymentMethodId: $paymentMethodId, deliveryMethodId: $deliveryMethodId)';
  }
}
