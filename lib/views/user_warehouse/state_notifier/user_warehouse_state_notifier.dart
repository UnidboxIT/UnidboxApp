import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import 'package:unidbox_app/views/user_warehouse/user_warehouse_repository.dart';
import '../../../utils/commons/super_print.dart';
import '../state/user_warehouse_state.dart';

class UserWarehouseStateNotifier extends StateNotifier<UserWarehouseState> {
  UserWarehouseStateNotifier(this._warehouseRepository)
      : super(const UserWarehouseState.initial());

  final UserWarehouseRepository _warehouseRepository;
  UserWarehouse userWarehouse = UserWarehouse();
  Future<void> getUserWarehouse() async {
    try {
      state = const UserWarehouseState.loading();
      Response response = await _warehouseRepository.warehouse();
      superPrint(response.body, title: "User Warehouse");
      var result = jsonDecode(response.body);
      superPrint(result);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (result['result']['code'] == 200) {
          userWarehouse =
              UserWarehouse.fromJson(result['result']['records'][0]);
          superPrint(userWarehouse.warehouseList);
          state = UserWarehouseState.loadWarehouseData(userWarehouse);
        }
      }
    } catch (e) {
      superPrint(e);
    }
  }
}
