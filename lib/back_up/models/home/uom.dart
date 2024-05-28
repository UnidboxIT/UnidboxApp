class Uom {
  int id;
  String name;
  Uom({required this.id, required this.name});

  factory Uom.fromJson(Map<String, dynamic> json) {
    return Uom(id: json['id'], name: json['name']);
  }
}
