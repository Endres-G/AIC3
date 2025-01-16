class RequestCardModel {
  const RequestCardModel({
    required this.status,
    required this.pendingDay,
    required this.pendingId,
    required this.client,
    required this.totalValue,
  });

  final String pendingId;
  final String client;
  final DateTime pendingDay;
  final double totalValue;
  final String status;

  String get formattedPendingDay {
    return '${pendingDay.day}/${pendingDay.month}/${pendingDay.year}'; // Exemplo simples
  }

  String get formattedTotalValue {
    String value =
        totalValue.toStringAsFixed(2); // Garantir duas casas decimais
    value = value.replaceAll('.', ','); // Substituir o ponto por vírgula
    value = value.replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) {
      return '${match.group(1)}.';
    }); // Adicionar pontos como separadores de milhares
    return 'R\$ $value';
  }

  factory RequestCardModel.fromJson(Map<String, dynamic> json) {
    return RequestCardModel(
      pendingId: json['pendingId'] as String,
      client: json['client'] as String,
      pendingDay: DateTime.parse(json['pendingDay'] as String),
      totalValue: json['totalValue'] as double,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'pendingId': pendingId,
      'client': client,
      'pendingDay': pendingDay.toIso8601String(),
      'totalValue': totalValue,
    };
  }
}
