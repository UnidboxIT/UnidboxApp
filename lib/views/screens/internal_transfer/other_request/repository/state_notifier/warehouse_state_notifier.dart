import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/warehouse_state.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/other_request_repository.dart';

import '../../../../../../utils/commons/super_print.dart';
import '../../domain/warehouse.dart';

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
      superPrint(warehouseList);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        warehouseList.add(Warehouse.fromJson(element));
      }
      state = WarehouseState.loadWarehouseData(warehouseList);
    } catch (e) {
      superPrint(e.toString());
    }
  }
}
