class OngoingJob {
  final List<dynamic> partnerList;
  final String jobType;
  final String deliStreet;
  final String deliPostalCode;

  OngoingJob(
      {this.partnerList = const [],
      this.jobType = "",
      this.deliStreet = '',
      this.deliPostalCode = ''});

  factory OngoingJob.fromJson(Map<String, dynamic> json) {
    return OngoingJob(
        partnerList: List.from(json['partner_id']),
        jobType: json['job_type'],
        deliStreet: json['deli_street'].toString(),
        deliPostalCode: json['deli_postal_code'].toString());
  }
}

class SelectionField {
  final String value;
  final String name;

  SelectionField({this.value = "", this.name = ""});

  factory SelectionField.fromJson(Map<String, dynamic> json) {
    return SelectionField(
      value: json['value'].toString(),
      name: json['name'].toString(),
    );
  }
}
