class RequestCardModel {
  const RequestCardModel({
    required this.pendingDay,
    required this.pendingId,
    required this.client,
    required this.totalValue,
  });

  final String pendingId;
  final String client;
  final DateTime pendingDay;
  final int totalValue;

  String get formattedPendingDay {
    return '${pendingDay.day}/${pendingDay.month}/${pendingDay.year}'; // Exemplo simples
  }

  String get formattedTotalValue {
    return '\$${totalValue.toString().replaceAll(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), r'$1,')}';
  }

  factory RequestCardModel.fromJson(Map<String, dynamic> json) {
    return RequestCardModel(
      pendingId: json['pendingId'] as String,
      client: json['client'] as String,
      pendingDay: DateTime.parse(json['pendingDay'] as String),
      totalValue: json['totalValue'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pendingId': pendingId,
      'client': client,
      'pendingDay': pendingDay.toIso8601String(),
      'totalValue': totalValue,
    };
  }
}
