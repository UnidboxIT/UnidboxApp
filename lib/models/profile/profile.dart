class Profile {
  final int id;
  final String name;
  final String phone;
  final String mobile;
  final String email;
  final List<dynamic> countryList;
  final List<String> race;
  final List<String> religion;
  final String imageUrl;
  final String firstName;
  final String lastName;

  Profile(
      {this.id = 0,
      this.name = "",
      this.phone = "",
      this.email = "",
      this.countryList = const [],
      this.imageUrl = "",
      this.mobile = "",
      this.race = const [],
      this.religion = const [],
      this.firstName = "",
      this.lastName = ""});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] ?? 0,
      name: json['name'].toString(),
      phone: json['phone'].toString(),
      mobile: json['mobile'].toString(),
      email: json['email'].toString(),
      countryList: List.from(json['country_id']),
      race: List.from(json['race']),
      religion: List.from(json['religion']),
      imageUrl: json['image_url'].toString(),
      firstName: json['first_name'].toString(),
      lastName: json['last_name'].toString(),
    );
  }
}
