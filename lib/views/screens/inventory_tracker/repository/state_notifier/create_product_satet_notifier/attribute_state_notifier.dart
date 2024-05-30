import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/inventory_tracker_repository.dart';
import '../../../../../../utils/commons/super_print.dart';
import '../../../domain/attribute.dart';
import '../../state/create_product_state/attribute_state.dart';

class AttributeStateNotifier extends StateNotifier<AttributeState> {
  AttributeStateNotifier(this._inventoryTrackerRepository)
      : super(const AttributeState.initial());

  final InventoryTrackerRepository _inventoryTrackerRepository;

  List<Attribute> attributeList = [];
  List<Attribute> attributeListByID = [];
  Future<void> getAttribute() async {
    try {
      state = const AttributeState.loading();
      Response response = await _inventoryTrackerRepository.attribute();
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      attributeList.clear();
      for (var element in dataList) {
        attributeList.add(Attribute.fromJson(element));
      }
      state = AttributeState.loadAttributeList(attributeList);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  Future<void> getAttributeByID(id) async {
    try {
      state = const AttributeState.attributeLoading();
      Response response = await _inventoryTrackerRepository.attributeByID(id);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      attributeListByID.clear();
      for (var element in dataList) {
        attributeListByID.add(Attribute.fromJson(element));
      }
      state = AttributeState.loadAttributeListByID(attributeListByID);
    } catch (e) {
      superPrint(e.toString());
    }
  }

  void eachSelectedUom(Attribute attribute) {
    state = AttributeState.selectedAttribute(attribute);
    superPrint(attribute.name);
  }
}
