class Products {
  int id;
  String name;
  String defaultCode;
  List categoryIdList;
  String barcode;
  double price;
  double quantity;

  Products(
      {this.id = 0,
      this.name = "",
      this.defaultCode = "",
      this.categoryIdList = const [],
      this.barcode = "",
      this.price = 0.0,
      this.quantity = 0.0});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'] ?? 0,
        name: json['name'].toString(),
        defaultCode: json['default_code'].toString(),
        categoryIdList: List.from(json['categ_id']),
        barcode: json['barcode'].toString(),
        price: json['price'] ?? 0.0,
        quantity: json['quantity'] ?? 0.0);
  }
}
