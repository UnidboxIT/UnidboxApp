import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/multi_uom.dart';
part 'multi_uom_state.freezed.dart';

extension Getters on MultiUomState {
  bool get isLoading => this is LoadingUom;
}

@freezed
class MultiUomState with _$MultiUomState {
  const factory MultiUomState.loadUomList(List<MultiUom> uomList) =
      MultiUomList;

  const factory MultiUomState.selectedUom(MultiUom selectedRack) =
      SelectedMultiUom;
  const factory MultiUomState.initial() = Initial;
  const factory MultiUomState.loading() = LoadingUom;
  const factory MultiUomState.success() = Success;
  const factory MultiUomState.error({String? error}) = Error;
}
