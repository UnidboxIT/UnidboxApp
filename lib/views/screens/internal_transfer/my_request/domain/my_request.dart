class MyRequest {
  int id;
  String name;
  String intStatus;
  List userId;
  List requestToWh;
  List<ProductLineId> productLineList;
  String createDate;

  MyRequest({
    this.id = 0,
    this.name = "",
    this.intStatus = "",
    this.userId = const [],
    this.requestToWh = const [],
    this.productLineList = const [],
    this.createDate = "",
  });

  factory MyRequest.fromJson(Map<String, dynamic> json) {
    List<ProductLineId> productList = [];
    if (json['product_line_ids'] != null) {
      for (var data in json['product_line_ids']) {
        productList.add(ProductLineId.fromJson(data));
      }
    } else {
      productList = [];
    }
    return MyRequest(
        id: json['id'] ?? 0,
        name: json['name'].toString(),
        intStatus: json['int_status'].toString(),
        userId: List.from(json['user_id']),
        requestToWh: json['request_to_wh'] == false
            ? []
            : List.from(json['request_to_wh']),
        productLineList: productList,
        createDate: json['date'].toString());
  }
}

class ProductLineId {
  int id;
  List productIdList;
  String code;
  String model;
  double qty;
  String imageUrl;
  double price;
  String status;
  List warehouseList;
  List requestWarehouse;

  ProductLineId(
      {this.id = 0,
      this.productIdList = const [],
      this.code = "",
      this.model = "",
      this.qty = 0.0,
      this.imageUrl = "",
      this.price = 0.0,
      this.status = "",
      this.warehouseList = const [],
      this.requestWarehouse = const []});

  factory ProductLineId.fromJson(Map<String, dynamic> json) {
    return ProductLineId(
        id: json['id'],
        productIdList: List.from(json['product_id']),
        code: json['code'].toString(),
        model: json['model'].toString(),
        qty: json['quantity'] ?? 0.0,
        imageUrl: json['image_url'].toString(),
        price: json['price'] ?? 0.0,
        status: json['status'].toString(),
        warehouseList: json['warehouse_id'] == false
            ? []
            : List.from(json['warehouse_id']),
        requestWarehouse:
            json['wh_from_id'] == false ? [] : List.from(json['wh_from_id']));
  }
}