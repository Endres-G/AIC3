class PendingDetailsModel {
  final int id;
  final int sellerId;
  final int buyerId;
  final DateTime dateCreated;
  String status;
  final String totalValue;
  final int paymentMethodId;
  final int deliveryMethodId;
  final List<TransactionItem> items;
  final PaymentMethod paymentMethod;
  final DeliveryMethod deliveryMethod;

  PendingDetailsModel({
    required this.id,
    required this.sellerId,
    required this.buyerId,
    required this.dateCreated,
    required this.status,
    required this.totalValue,
    required this.paymentMethodId,
    required this.deliveryMethodId,
    required this.items,
    required this.paymentMethod,
    required this.deliveryMethod,
  });

  factory PendingDetailsModel.fromJson(Map<String, dynamic> json) {
    return PendingDetailsModel(
      id: json['id'],
      sellerId: json['sellerId'],
      buyerId: json['buyerId'],
      dateCreated: DateTime.parse(json['dateCreated']),
      status: json['status'],
      totalValue: json['totalValue'],
      paymentMethodId: json['paymentMethodId'],
      deliveryMethodId: json['deliveryMethodId'],
      items: (json['items'] as List)
          .map((item) => TransactionItem.fromJson(item))
          .toList(),
      paymentMethod: PaymentMethod.fromJson(json['paymentMethod']),
      deliveryMethod: DeliveryMethod.fromJson(json['deliveryMethod']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellerId': sellerId,
      'buyerId': buyerId,
      'dateCreated': dateCreated.toIso8601String(),
      'status': status,
      'totalValue': totalValue,
      'paymentMethodId': paymentMethodId,
      'deliveryMethodId': deliveryMethodId,
      'items': items.map((item) => item.toJson()).toList(),
      'paymentMethod': paymentMethod.toJson(),
      'deliveryMethod': deliveryMethod.toJson(),
    };
  }
}

class TransactionItem {
  final int id;
  final int transactionId;
  final int productVariationId;
  final int quantity;
  final String unitPrice;
  final String subtotal;

  TransactionItem({
    required this.id,
    required this.transactionId,
    required this.productVariationId,
    required this.quantity,
    required this.unitPrice,
    required this.subtotal,
  });

  factory TransactionItem.fromJson(Map<String, dynamic> json) {
    return TransactionItem(
      id: json['id'],
      transactionId: json['transactionId'],
      productVariationId: json['productVariationId'],
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
      subtotal: json['subtotal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transactionId': transactionId,
      'productVariationId': productVariationId,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'subtotal': subtotal,
    };
  }
}

class PaymentMethod {
  final int id;
  final String name;

  PaymentMethod({
    required this.id,
    required this.name,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class DeliveryMethod {
  final int id;
  final String name;

  DeliveryMethod({
    required this.id,
    required this.name,
  });

  factory DeliveryMethod.fromJson(Map<String, dynamic> json) {
    return DeliveryMethod(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
