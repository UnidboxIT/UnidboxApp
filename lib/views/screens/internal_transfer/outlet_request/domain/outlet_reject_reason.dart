class OutletRejectReason {
  int id;
  String reason;
  OutletRejectReason({required this.id, required this.reason});

  factory OutletRejectReason.fromJson(Map<String, dynamic> json) {
    return OutletRejectReason(
      id: json['id'] ?? 0,
      reason: json['name'].toString(),
    );
  }
}
