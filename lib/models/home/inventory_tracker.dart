class InventoryTracker {
  final int id;
  final String name;
  final String parentID;
  final String imageUrl;

  InventoryTracker(
      {required this.id,
      required this.name,
      required this.parentID,
      required this.imageUrl});

  factory InventoryTracker.fromJson(Map<String, dynamic> json) {
    return InventoryTracker(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      parentID: json['parent_id'].toString(),
      imageUrl: json['image_url'].toString(),
    );
  }
}
