class Products {
  int id;
  String name;
  String imageUrl;
  String defaultCode;
  List categoryIdList;
  String barcode;
  double price;
  double quantity;
  double qtyOutStock;

  Products(
      {this.id = 0,
      this.name = "",
      this.imageUrl = "",
      this.defaultCode = "",
      this.categoryIdList = const [],
      this.barcode = "",
      this.price = 0.0,
      this.quantity = 0.0,
      this.qtyOutStock = 0.0});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'] ?? 0,
        name: json['name'].toString(),
        imageUrl: json['image_url'].toString(),
        defaultCode: json['default_code'].toString(),
        categoryIdList: List.from(json['categ_id']),
        barcode: json['barcode'].toString(),
        price: json['sale_price'] ?? 0.0,
        quantity: json['quantity'] ?? 0.0,
        qtyOutStock: json['qty_warning_out_stock'] ?? 0.0);
  }
}
