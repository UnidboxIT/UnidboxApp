class Racks {
  int id;
  String name;

  Racks({this.id = 0, this.name = ''});

  factory Racks.fromJson(Map<String, dynamic> json) {
    return Racks(id: json['id'] ?? 0, name: json['name'].toString());
  }
}
