class ReasonsData {
  int id;
  String name;
  bool newRequest;
  String option;
  bool reject;
  ReasonsData(
      {required this.id,
      required this.name,
      required this.newRequest,
      required this.option,
      required this.reject});

  factory ReasonsData.fromJson(Map<String, dynamic> json) {
    return ReasonsData(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      newRequest: json['new_request'] ?? false,
      option: json['option'].toString(),
      reject: json['reject'] ?? false,
    );
  }
}
