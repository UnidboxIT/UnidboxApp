class MyRequest {
  int id;
  String intStatus;
  List requestToWh;
  List requestFromWh;
  List userId;
  List<ProductLineId> productLineList;

  MyRequest({
    this.id = 0,
    this.intStatus = "",
    this.requestToWh = const [],
    this.requestFromWh = const [],
    this.userId = const [],
    this.productLineList = const [],
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
        intStatus: json['int_status'].toString(),
        requestToWh: List.from(json['request_to_wh']),
        requestFromWh: List.from(json['requested_wh']),
        userId: List.from(json['user_id']),
        productLineList: productList);
  }
}

class ProductLineId {
  int id;
  List productIdList;
  String code;
  String model;
  double qty;

  ProductLineId({
    this.id = 0,
    this.productIdList = const [],
    this.code = "",
    this.model = "",
    this.qty = 0.0,
  });

  factory ProductLineId.fromJson(Map<String, dynamic> json) {
    return ProductLineId(
      id: json['id'],
      productIdList: List.from(json['product_id']),
      code: json['code'].toString(),
      model: json['model'].toString(),
      qty: json['quantity'] ?? 0.0,
    );
  }
}
