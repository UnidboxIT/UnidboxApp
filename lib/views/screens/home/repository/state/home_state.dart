import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/home/domain/noti.dart';
import '../../domain/my_task.dart';
part 'home_state.freezed.dart';

extension Getters on HomeState {
  bool get isLoading => this is Loading;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loadNoti(List<Noti> notiList) = NotiList;
  const factory HomeState.loadMyTask(List<MyTask> myTaskList) = MyTaskList;
  const factory HomeState.loadMyTaskDetail(
      Map<int, List<MyTask>> myTaskDetailMap) = MyTaskDetailMap;
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.error({String? error}) = Error;
}
