import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/uom.dart';
part 'main_uom_state.freezed.dart';

extension Getters on MainUomState {
  bool get isLoading => this is LoadingMainUom;
}

@freezed
class MainUomState with _$MainUomState {
  const factory MainUomState.loadMainUomList(List<Uom> uomList) = MainUomList;

  const factory MainUomState.selectedMainUom(Uom selectedRack) =
      MainSelectedUom;
  const factory MainUomState.initial() = Initial;
  const factory MainUomState.loading() = LoadingMainUom;
  const factory MainUomState.success() = Success;
  const factory MainUomState.error({String? error}) = Error;
}
