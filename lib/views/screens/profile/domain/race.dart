class Race {
  final int id;
  final String name;

  Race({this.id = 0, this.name = ""});

  factory Race.fromJson(Map<String, dynamic> json) {
    return Race(id: json['id'] ?? 0, name: json['name'].toString());
  }
}
