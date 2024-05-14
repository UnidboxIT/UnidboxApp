class InhouseStock {
  final List productList;
  final double qty;
  final List warehouseList;

  InhouseStock(
      {this.productList = const [],
      this.qty = 0.0,
      this.warehouseList = const []});

  factory InhouseStock.fromJson(Map<String, dynamic> json) {
    return InhouseStock(
      productList: List.from(json['product']),
      qty: json['quantity'],
      warehouseList: List.from(json['warehouse']),
    );
  }
}
