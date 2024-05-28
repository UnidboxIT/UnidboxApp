class JobOrder {
  final List<dynamic> partnerList;
  final String jobType;
  final String deliStreet;
  final String deliPostalCode;
  final List handymanIDs;
  final String fromDate;
  final String toDate;

  JobOrder(
      {this.partnerList = const [],
      this.jobType = "",
      this.deliStreet = '',
      this.deliPostalCode = '',
      this.handymanIDs = const [],
      this.fromDate = "",
      this.toDate = ""});

  factory JobOrder.fromJson(Map<String, dynamic> json) {
    return JobOrder(
        partnerList: List.from(json['partner_id']),
        jobType: json['job_type'],
        deliStreet: json['deli_street'].toString(),
        deliPostalCode: json['deli_postal_code'].toString(),
        handymanIDs: List.from(json['handyman_ids']),
        fromDate: json['from_datetime'].toString(),
        toDate: json['to_datetime'].toString());
  }
}
