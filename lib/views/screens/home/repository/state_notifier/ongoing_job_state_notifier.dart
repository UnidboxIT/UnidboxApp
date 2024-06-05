import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/home/domain/ongoing_job.dart';
import 'package:unidbox_app/views/screens/home/repository/state/ongoing_job_state.dart';
import '../../../auth/repository/auth_state_notifier.dart';
import '../home_repository.dart';

class OngoingJobStateNotifier extends StateNotifier<OngoingJobState> {
  OngoingJobStateNotifier(this._homeRepository)
      : super(const OngoingJobState.initial());
  final HomeRepository _homeRepository;

  Future<void> getAllOngoingJob(BuildContext context, WidgetRef ref) async {
    try {
      state = const OngoingJobState.loading();
      http.Response response = await _homeRepository.ongoingJob();
      Map<String, dynamic> result = jsonDecode(response.body);
      superPrint(result);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          List<OngoingJob> ongoinJobList =
              dataList.map((e) => OngoingJob.fromJson(e)).toList();
          getAllSelectionField();
          state = OngoingJobState.loadOngoingJob(ongoinJobList);
        }
      } else if (result.containsKey('error')) {
        if (result['error']['code'] == 100) {
          ref
              .read(authStateNotifierControllerProvider.notifier)
              .logout(context, ref);
        } else {
          CommonMethods.customizedAlertDialog(
              result['error']['message'], context);
        }
      }
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
