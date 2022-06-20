class Transaction {
  final int? id;
  final List items;
  final int quantity;
  final int cost;
  final DateTime date;

  const Transaction({
    this.id,
    required this.items,
    required this.quantity,
    required this.cost,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        items: json['items'],
        quantity: json['quantity'],
        cost: json['cost'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'items': items,
      'quantity': quantity,
      'cost': cost
    };
  }

  Transaction copy({
    int? id,
    List? items,
    int? quantity,
    int? cost,
    DateTime? date,
  }) =>
      Transaction(
        id: id ?? this.id,
        items: items ?? this.items,
        quantity: quantity ?? this.quantity,
        cost: cost ?? this.cost,
        date: date ?? this.date,
      );
}
