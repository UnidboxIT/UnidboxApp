class OngoingJob {
  final List<dynamic> partnerList;
  final String jobType;

  OngoingJob({this.partnerList = const [], this.jobType = ""});

  factory OngoingJob.fromJson(Map<String, dynamic> json) {
    return OngoingJob(
        partnerList: List.from(json['partner_id']), jobType: json['job_type']);
  }
}
