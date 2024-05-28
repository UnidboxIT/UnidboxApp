class Noti {
  final List<TrackingValue> trackingValueList;
  final String body;

  Noti({this.trackingValueList = const [], this.body = ""});

  factory Noti.fromJson(Map<String, dynamic> json) {
    List<TrackingValue> trackingValue = [];
    if (json['tracking_value_ids'] != null) {
      trackingValue = <TrackingValue>[];
      json['tracking_value_ids'].forEach((v) {
        trackingValue.add(TrackingValue.fromJson(v));
      });
    } else {
      trackingValue = [];
    }
    return Noti(
      trackingValueList: trackingValue,
      body: json['body'],
    );
  }
}

class TrackingValue {
  final int id;
  final String fieldDesc;
  final String oldValue;
  final String newValue;

  TrackingValue(
      {this.id = 0,
      this.fieldDesc = "",
      this.oldValue = "",
      this.newValue = ""});

  factory TrackingValue.fromJson(Map<String, dynamic> json) {
    return TrackingValue(
      id: json['id'],
      fieldDesc: json['field_desc'].toString(),
      oldValue: json['old_value'].toString(),
      newValue: json['new_value'].toString(),
    );
  }
}
