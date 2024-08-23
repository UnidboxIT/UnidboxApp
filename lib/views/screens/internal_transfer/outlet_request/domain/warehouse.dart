class Warehouse {
  int id;
  String name;
  String code;

  Warehouse({this.id = 0, this.name = "", this.code = ""});

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(id: json['id'], name: json['name'], code: json['code']);
  }
}
