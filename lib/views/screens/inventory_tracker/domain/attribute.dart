class Attribute {
  int id;
  String name;
  List attributeList;

  Attribute({this.id = 0, this.name = '', this.attributeList = const []});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
        id: json['id'] ?? 0,
        name: json['name'].toString(),
        attributeList: List.from(json['attribute_value_ids']));
  }
}
