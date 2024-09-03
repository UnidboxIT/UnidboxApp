import 'package:freezed_annotation/freezed_annotation.dart';
part 'good_return_state.freezed.dart';

extension Getters on GoodReturnState {
  bool get isLoading => this is GoodReturnLoading;
}

@freezed
class GoodReturnState with _$GoodReturnState {
  const factory GoodReturnState.checkOut(
      Map<String, Map<int, List<bool>>> isGoodReturnMap) = IsGoodReturnMap;

  const factory GoodReturnState.initial() = Initial;
  const factory GoodReturnState.loading() = GoodReturnLoading;
  const factory GoodReturnState.error({String? error}) = GoodReturnError;
}
