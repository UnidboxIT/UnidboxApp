import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../my_request/repository/state/warehouse_state.dart';
import '../../domain/warehouse.dart';
import '../other_request_repository.dart';

class WarehouseStateNotifier extends StateNotifier<WarehouseState> {
  WarehouseStateNotifier(this._otherRequestRepository)
      : super(const WarehouseState.initial());
  final OtherRequestRepository _otherRequestRepository;

  List<Warehouse> warehouseList = [];

  Future<void> getAllWarehouse() async {
    try {
      state = const WarehouseState.loading();
      warehouseList.clear();
      Response response = await _otherRequestRepository.warehouse();
      var result = jsonDecode(response.body);
      superPrint(result);
      if (result.containsKey('result')) {
        if (result['result']['code'] == 200) {
          Iterable dataList = result['result']['records'];
          for (var element in dataList) {
            warehouseList.add(Warehouse.fromJson(element));
          }
          state = WarehouseState.loadWarehouseData(warehouseList);
        }
      } else if (result.containsKey('error')) {
        if (result['error']['data']['message'] == "Session expired") {
          //Session Expired
        } else {
          superPrint(
              "Warehouse Error ::: ${result['error']['data']['message']}");
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
