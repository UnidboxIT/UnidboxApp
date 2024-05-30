class Attribute {
  int id;
  String name;

  Attribute({this.id = 0, this.name = ''});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(id: json['id'] ?? 0, name: json['name'].toString());
  }
}
