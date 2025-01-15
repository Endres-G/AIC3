class HomeDataModel {
  final List<int> transactionsCountForLast7Days;
  final int totalTransactionsCountForLast7Days;
  final int totalTransactionsValueForLast7Days;

  HomeDataModel({
    required this.transactionsCountForLast7Days,
    required this.totalTransactionsCountForLast7Days,
    required this.totalTransactionsValueForLast7Days,
  });

  // Método para converter de JSON para o modelo
  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      transactionsCountForLast7Days:
          List<int>.from(json['transactionsCountForLast7Days']),
      totalTransactionsCountForLast7Days:
          json['totalTransactionsCountForLast7Days'],
      totalTransactionsValueForLast7Days:
          json['totalTransactionsValueForLast7Days'],
    );
  }

  // Método para converter o modelo para JSON
  Map<String, dynamic> toJson() {
    return {
      'transactionsCountForLast7Days': transactionsCountForLast7Days,
      'totalTransactionsCountForLast7Days': totalTransactionsCountForLast7Days,
      'totalTransactionsValueForLast7Days': totalTransactionsValueForLast7Days,
    };
  }
}
