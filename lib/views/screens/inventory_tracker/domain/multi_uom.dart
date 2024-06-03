class MultiUom {
  String value;
  String name;
  MultiUom({required this.value, required this.name});

  factory MultiUom.fromJson(Map<String, dynamic> json) {
    return MultiUom(value: json['value'], name: json['name']);
  }
}
