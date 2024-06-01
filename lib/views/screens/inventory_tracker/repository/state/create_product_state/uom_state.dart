import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
part 'uom_state.freezed.dart';

extension Getters on UomState {
  bool get isLoading => this is LoadingUom;
}

@freezed
class UomState with _$UomState {
  const factory UomState.loadUomList(List<Uom> uomList) = UomList;

  const factory UomState.selectedUom(Uom selectedRack) = SelectedUom;
  const factory UomState.initial() = Initial;
  const factory UomState.loading() = LoadingUom;
  const factory UomState.success() = Success;
  const factory UomState.error({String? error}) = Error;
}
