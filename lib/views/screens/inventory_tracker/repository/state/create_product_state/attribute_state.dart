import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/attribute.dart';
part 'attribute_state.freezed.dart';

extension Getters on AttributeState {
  bool get isLoading => this is Loading;
  bool get isAttributeLoading => this is AttributeLoading;
}

@freezed
class AttributeState with _$AttributeState {
  const factory AttributeState.loadAttributeList(
      List<Attribute> attributeList) = AttributeList;
  const factory AttributeState.loadAttributeListByID(
      List<Attribute> attributeListByID) = AttributeListByID;
  const factory AttributeState.selectedAttribute(Attribute attribute) =
      SelectedAttribute;
  const factory AttributeState.initial() = Initial;
  const factory AttributeState.loading() = Loading;
  const factory AttributeState.attributeLoading() = AttributeLoading;
  const factory AttributeState.error({String? error}) = Error;
}
