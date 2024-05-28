import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_pwd_state.freezed.dart';

extension Getters on ChangePwdState {
  bool get isLoading => this is Loading;
}

@freezed
class ChangePwdState with _$ChangePwdState {
  const factory ChangePwdState.success(String success) = ChangePwdSuccess;
  const factory ChangePwdState.initial() = Initial;
  const factory ChangePwdState.loading() = Loading;
  const factory ChangePwdState.error({String? error}) = Error;
}
