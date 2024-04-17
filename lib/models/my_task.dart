class MyTask {
  int id;
  String name;
  String imageUrl;

  MyTask({this.id = 0, this.name = "", this.imageUrl = ""});

  factory MyTask.fromJson(Map<String, dynamic> json) {
    return MyTask(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      imageUrl: json['image_url'].toString(),
    );
  }
}
