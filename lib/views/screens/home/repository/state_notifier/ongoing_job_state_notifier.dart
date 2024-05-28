import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/views/screens/home/domain/ongoing_job.dart';
import 'package:unidbox_app/views/screens/home/repository/state/ongoing_job_state.dart';
import '../home_repository.dart';

class OngoingJobStateNotifier extends StateNotifier<OngoingJobState> {
  OngoingJobStateNotifier(this._homeRepository)
      : super(const OngoingJobState.initial());
  final HomeRepository _homeRepository;

  Future<void> getAllOngoingJob() async {
    try {
      state = const OngoingJobState.loading();
      http.Response response = await _homeRepository.ongoingJob();
      Map<String, dynamic> result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      List<OngoingJob> ongoinJobList =
          dataList.map((e) => OngoingJob.fromJson(e)).toList();
      getAllSelectionField();
      state = OngoingJobState.loadOngoingJob(ongoinJobList);
    } catch (e) {
      state = OngoingJobState.error(error: e.toString());
    }
  }

  Future<void> getAllSelectionField() async {
    try {
      state = const OngoingJobState.loading();
      http.Response response = await _homeRepository.selectionField();
      Map<String, dynamic> result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      List<SelectionField> selectionFieldList =
          dataList.map((e) => SelectionField.fromJson(e)).toList();
      state = OngoingJobState.loadSelectionField(selectionFieldList);
    } catch (e) {
      state = OngoingJobState.error(error: e.toString());
    }
  }
}
