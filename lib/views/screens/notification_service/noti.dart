class NotiInfo {
  NotiInfo({
    this.title = "",
    this.body = "",
  });

  final String? title;
  final String? body;

  factory NotiInfo.fromJson(Map<String, dynamic> json) {
    return NotiInfo(
      title: json['title'],
      body: json['body'],
    );
  }
}
