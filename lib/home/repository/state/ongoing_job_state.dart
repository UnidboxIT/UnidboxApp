import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/home/domain/ongoing_job.dart';
part 'ongoing_job_state.freezed.dart';

extension Getters on OngoingJobState {
  bool get isLoading => this is Loading;
}

@freezed
class OngoingJobState with _$OngoingJobState {
  const factory OngoingJobState.loadOngoingJob(List<OngoingJob> ongoingJob) =
      OngoingJobList;
  const factory OngoingJobState.loadSelectionField(
      List<SelectionField> seclectionField) = SelectionFieldList;
  const factory OngoingJobState.initial() = Initial;
  const factory OngoingJobState.loading() = Loading;
  const factory OngoingJobState.error({String? error}) = Error;
}
