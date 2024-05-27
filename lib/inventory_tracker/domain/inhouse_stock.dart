class InhouseStock {
  final List productList;
  final String qty;
  final List warehouseList;

  InhouseStock(
      {this.productList = const [],
      this.qty = "0",
      this.warehouseList = const []});

  factory InhouseStock.fromJson(Map<String, dynamic> json) {
    return InhouseStock(
      productList: List<dynamic>.from(json['product'] ?? []),
      qty: json['quantity'].toString(),
      warehouseList: List<dynamic>.from(json['warehouse'] ?? []),
    );
  }
}
