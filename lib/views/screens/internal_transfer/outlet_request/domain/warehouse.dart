class Warehouse {
  int id;
  String name;

  Warehouse({this.id = 0, this.name = ""});

  factory Warehouse.fromJson(Map<String, dynamic> json) {
    return Warehouse(id: json['id'], name: json['name']);
  }
}
