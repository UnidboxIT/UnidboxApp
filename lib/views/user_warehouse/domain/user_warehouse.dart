class UserWarehouse {
  int id;
  String name;
  List warehouseList;
  UserWarehouse({this.id = 0, this.name = "", this.warehouseList = const []});

  factory UserWarehouse.fromJson(Map<String, dynamic> json) {
    return UserWarehouse(
      id: json['id'] ?? 0,
      name: json['name'],
      warehouseList: List.from(json['warehouse_id'] ?? []),
    );
  }
}
