import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/racks.dart';
part 'rack_state.freezed.dart';

extension Getters on RackState {
  bool get isLoading => this is Loading;
  bool get isUpdateLoading => this is UpdateLoading;
}

@freezed
class RackState with _$RackState {
  const factory RackState.loadRackList(List<Racks> rackList) = RackList;

  const factory RackState.selectedRack(List<Racks> selectedRack) = SelectedRack;
  const factory RackState.initial() = Initial;
  const factory RackState.loading() = Loading;
  const factory RackState.updateLoading() = UpdateLoading;
  const factory RackState.success() = Success;
  const factory RackState.error({String? error}) = Error;
}
