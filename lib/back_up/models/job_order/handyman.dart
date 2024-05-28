class HandyMan {
  final int id;
  final String name;

  HandyMan({this.id = 0, this.name = ""});

  factory HandyMan.fromJson(Map<String, dynamic> json) {
    return HandyMan(id: json['id'] ?? 0, name: json['name'].toString());
  }
}
