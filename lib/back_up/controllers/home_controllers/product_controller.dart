import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unidbox_app/services/home/product_service.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;
import '../../models/home/uom.dart';

class ProductController extends GetxController {
  bool isProductLoading = false;

  TextEditingController txtSearch = TextEditingController();
  ScrollController scrollController = ScrollController();
  ScrollController uomScrollController = ScrollController();
  bool xDataExit = true;
  bool xLoading = false;
  String categoryID = "";
  int productVarietyIncrement = 1;
  List varietyIncrementValueList = [];
  Map<int, dynamic> varietyValueMap = {};
  TextEditingController txtVarietyBarCode = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtFactor = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtModel = TextEditingController();
  TextEditingController txtVendor = TextEditingController();
  TextEditingController txtBrand = TextEditingController();
  TextEditingController txtBarcode = TextEditingController();
  TextEditingController txtSalePrice = TextEditingController();
  TextEditingController txtCost = TextEditingController();
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
  bool isCreateProductLoading = false;
  int perPage = 10;
  int pageNumber = 1;
  List<Uom> uomList = [];
  String uomName = "";

  @override
  onInit() {
    super.onInit();
    uomScrollController.addListener(() async {
      if (uomScrollController.position.pixels >=
          uomScrollController.position.maxScrollExtent) {
        if (xDataExit) {
          if (!xLoading) {
            xLoading = true;
            update();
            ++pageNumber;
            await getUom();
            await Future.delayed(const Duration(seconds: 1));
            xLoading = false;
            update();
          }
        } else {
          xDataExit = true;
          update();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  updateUomName(String uom) {
    uomName = uom;
    update();
  }

  incrementProductVariety() {
    addProductVariety();
    txtVarietyBarCode.clear();
    txtFactor.clear();
    txtPrice.clear();
    productVarietyIncrement += 1;
    varietyIncrementValueList.add(productVarietyIncrement);
    superPrint(varietyValueMap);
    update();
  }

  Future<void> addProductVariety() async {
    varietyValueMap.addAll({
      productVarietyIncrement: {
        "barcode": txtVarietyBarCode.text,
        "uom_option": "BX",
        "factor": txtFactor.text,
        "price": txtPrice.text.toString(),
      },
    });
    superPrint(varietyValueMap);
    update();
  }

  decrementProductVariety(int data) {
    if (productVarietyIncrement > 1) {
      varietyIncrementValueList.remove(data);
      varietyValueMap.remove(data);
      update();
    }
    superPrint(varietyValueMap);
  }

  clearProductVariety() {
    txtVarietyBarCode.clear();
    txtFactor.clear();
    txtPrice.clear();
    txtName.clear();
    txtModel.clear();
    txtVendor.clear();
    txtBrand.clear();
    txtBarcode.clear();
    txtSalePrice.clear();
    txtCost.clear();
    varietyValueMap.clear();
    productVarietyIncrement = 1;
    varietyIncrementValueList.clear();
    varietyIncrementValueList.add(1);
    imageFile = File("");
    base64Image = "";
    uomName = "";
    update();
  }

  updateCategoryID(String id) async {
    categoryID = id;
    update();
  }

  clearSelectedImage() {
    imageFile = File("");
    base64Image = "";
    update();
  }

  Future<void> createEachProduct() async {
    isCreateProductLoading = true;
    update();
    try {
      // http.Response response = await ProductService.createProduct(
      //   base64Image,
      //   txtName.text,
      //   txtModel.text,
      //   txtVendor.text,
      //   txtBrand.text,
      //   txtBarcode.text,
      //   txtSalePrice.text,
      //   txtCost.text,
      //   varietyValueMap.values.toList(),
      // );
      //var result = jsonDecode(response.body);
      // CommonMethods.customizedAlertDialog(result['result']['message'],
      //     isPop: false);
      clearProductVariety();
    } catch (e) {
      superPrint(e.toString());
    }
    isCreateProductLoading = false;
    update();
  }

  Future<void> getUom() async {
    try {
      http.Response response = await ProductService.uom(pageNumber, perPage);
      var result = jsonDecode(response.body);
      Iterable dataList = result['result']['records'];
      for (var element in dataList) {
        uomList.add(Uom.fromJson(element));
      }
      if (dataList.isEmpty) {
        xDataExit = false;
        update();
      }
    } catch (e) {
      superPrint(e.toString());
    }

    update();
  }
}
