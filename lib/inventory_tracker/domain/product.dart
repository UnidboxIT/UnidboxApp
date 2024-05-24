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
  String brand;
  String model;
  double costPrice;
  List attributeList;
  List uomList;
  List<List<dynamic>> multiUomList;

  Products(
      {this.id = 0,
      this.name = "",
      this.imageUrl = "",
      this.defaultCode = "",
      this.categoryIdList = const [],
      this.barcode = "",
      this.price = 0.0,
      this.quantity = 0.0,
      this.qtyOutStock = 0.0,
      this.brand = "",
      this.model = "",
      this.costPrice = 0.0,
      this.attributeList = const [],
      this.uomList = const [],
      this.multiUomList = const []});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        id: json['id'] ?? 0,
        brand: json['brand'].toString(),
        defaultCode: json['default_code'].toString(),
        barcode: json['barcode'].toString(),
        model: json['model'].toString(),
        quantity: json['quantity'] ?? 0.0,
        imageUrl: json['image_url'].toString(),
        qtyOutStock: json['qty_warning_out_stock'] ?? 0.0,
        name: json['name'].toString(),
        categoryIdList: List.from(json['categ_id']),
        costPrice: json['cost_price'] ?? 0.0,
        price: json['sale_price'] ?? 0.0,
        attributeList: List.from(json['attributes']),
        uomList: List.from(json['uom_id'] ?? []),
        multiUomList: (json['multi_uom_ids'] as List)
            .map((e) => List<dynamic>.from(e))
            .toList());
  }
}
