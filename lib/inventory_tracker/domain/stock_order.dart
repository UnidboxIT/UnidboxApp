class StockOrder {
  final int id;
  final List company;
  final List name;
  final double price;
  StockOrder(
      {this.id = 0,
      this.company = const [],
      this.name = const [],
      this.price = 0.0});

  factory StockOrder.fromJson(Map<String, dynamic> json) {
    return StockOrder(
        id: json['id'],
        company: List.from(json['company_id']),
        name: List.from(json['name']),
        price: json['price']);
  }
}
