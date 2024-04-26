class Country {
  final int id;
  final String name;

  Country({this.id = 0, this.name = ""});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(id: json['id'] ?? 0, name: json['name'].toString());
  }
}
