class MyTask {
  int id;
  String name;
  List parentID;
  String imageUrl;

  MyTask(
      {this.id = 0,
      this.name = "",
      this.parentID = const [],
      this.imageUrl = ""});

  factory MyTask.fromJson(Map<String, dynamic> json) {
    List dataList = [];
    if (json['parent_id'] != false) {
      dataList = List.from(json['parent_id']);
    }
    return MyTask(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      parentID: dataList,
      imageUrl: json['image_url'].toString(),
    );
  }
}
