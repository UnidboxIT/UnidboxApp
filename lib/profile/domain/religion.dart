class Religion {
  final int id;
  final String name;

  Religion({this.id = 0, this.name = ""});

  factory Religion.fromJson(Map<String, dynamic> json) {
    return Religion(id: json['id'] ?? 0, name: json['name'].toString());
  }
}
