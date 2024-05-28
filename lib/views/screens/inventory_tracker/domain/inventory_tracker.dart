class InventoryTracker {
  final int id;
  final String name;
  final List parentID;
  final String imageUrl;

  InventoryTracker(
      {required this.id,
      required this.name,
      required this.parentID,
      required this.imageUrl});

  factory InventoryTracker.fromJson(Map<String, dynamic> json) {
    List<dynamic> dataList = [];
    if (json['parent_id'] != false) {
      dataList = List.from(json['parent_id']);
    }
    return InventoryTracker(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      parentID: dataList,
      imageUrl: json['image_url'].toString(),
    );
  }
}
