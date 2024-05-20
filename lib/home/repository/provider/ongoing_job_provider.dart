import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/home/repository/home_repository.dart';
import 'package:unidbox_app/home/repository/state/ongoing_job_state.dart';
import 'package:unidbox_app/home/repository/state_notifier/ongoing_job_state_notifier.dart';

final ongoingJobStateProvicer = StateProvider((ref) => HomeRepository());

final ongoingJobStateNotifier =
    StateNotifierProvider<OngoingJobStateNotifier, OngoingJobState>((ref) {
  return OngoingJobStateNotifier(ref.watch(ongoingJobStateProvicer));
});
