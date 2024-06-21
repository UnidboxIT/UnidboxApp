import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unidbox_app/views/user_warehouse_service/domain/user_warehouse.dart';
part 'user_warehouse_state.freezed.dart';

extension Getters on UserWarehouseState {
  bool get isLoading => this is Loading;
}

@freezed
class UserWarehouseState with _$UserWarehouseState {
  const factory UserWarehouseState.loadWarehouseData(UserWarehouse warehouse) =
      UserWarehouseData;
  const factory UserWarehouseState.initial() = Initial;
  const factory UserWarehouseState.loading() = Loading;
  const factory UserWarehouseState.error({String? error}) = Error;
}
