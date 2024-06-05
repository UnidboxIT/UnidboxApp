import '../../my_request/domain/my_request.dart';

class OtherRequest {
  int id;
  String name;
  String intStatus;
  List requestToWh;
  List requestFromWh;
  List userId;
  List<ProductLineId> productLineList;
  String createDate;

  OtherRequest({
    this.id = 0,
    this.name = "",
    this.intStatus = "",
    this.requestToWh = const [],
    this.requestFromWh = const [],
    this.userId = const [],
    this.productLineList = const [],
    this.createDate = "",
  });

  factory OtherRequest.fromJson(Map<String, dynamic> json) {
    List<ProductLineId> productList = [];
    if (json['product_line_ids'] != null) {
      for (var data in json['product_line_ids']) {
        productList.add(ProductLineId.fromJson(data));
      }
    } else {
      productList = [];
    }
    return OtherRequest(
        id: json['id'] ?? 0,
        name: json['name'].toString(),
        intStatus: json['int_status'].toString(),
        requestToWh: json['request_to_wh'] == false
            ? []
            : List.from(json['request_to_wh']),
        requestFromWh: json['requested_wh'] == false
            ? []
            : List.from(json['requested_wh']),
        userId: json['user_id'] == false ? [] : List.from(json['user_id']),
        productLineList: productList,
        createDate: json['create_date'].toString());
  }
}
