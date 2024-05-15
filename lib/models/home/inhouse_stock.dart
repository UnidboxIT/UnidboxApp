class InhouseStock {
  final List productList;
  final String qty;
  final List warehouseList;

  InhouseStock(
      {this.productList = const [],
      this.qty = "",
      this.warehouseList = const []});

  factory InhouseStock.fromJson(Map<String, dynamic> json) {
    return InhouseStock(
      productList: List.from(json['product']),
      qty: json['quantity'].toString(),
      warehouseList: List.from(json['warehouse']),
    );
  }
}
