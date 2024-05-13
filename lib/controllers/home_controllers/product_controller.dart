import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unidbox_app/services/home/product_service.dart';
import 'package:unidbox_app/utils/commons/common_method.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:http/http.dart' as http;
import 'package:unidbox_app/views/screens/home/inventory_screens/inventory_tracker/product_screen.dart';
import '../../models/home/product.dart';
import '../../models/home/uom.dart';

class ProductController extends GetxController {
  List<Products> productList = [];
  bool isProductLoading = false;
  List<Products> searchProductsList = [];
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
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (xDataExit) {
          if (!xLoading) {
            xLoading = true;
            superPrint(xLoading);
            update();
            //++pageNumber;
            //await getAllProductsByCategoryID();
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

  Future<void> searchProductByText(String query,
      {bool isInventoryTracker = false}) async {
    searchProductsList.clear();
    if (query.isEmpty) {
      searchProductsList.addAll(productList);
    } else {
      searchProductsList = productList
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.barcode.toLowerCase().contains(query.toLowerCase()) ||
              element.quantity
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }

    update();
  }

  Future<void> getAllProductsByCategoryID(String id) async {
    if (productList.isNotEmpty) {
      isProductLoading = true;
      update();
    }

    try {
      http.Response response = await ProductService.products(id, 0);
      var result = jsonDecode(response.body);
      productList.clear();
      searchProductsList.clear();
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        for (var element in dataList) {
          productList.add(Products.fromJson(element));
        }
        for (var data in productList) {
          searchProductsList.add(data);
        }
        // if (dataList.isEmpty) {
        //   xDataExit = false;
        //   update();
        // }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isProductLoading = false;
    update();
  }

  Future<void> scanProductByBarCode(String barcode) async {
    if (productList.isEmpty) {
      isProductLoading = true;
      update();
    }
    try {
      http.Response response = await ProductService.scanProduct(barcode);
      var result = jsonDecode(response.body);
      productList.clear();
      searchProductsList.clear();
      superPrint(result);
      if (result['result']['code'] == 200) {
        Iterable dataList = result['result']['records'];
        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            productList.add(Products.fromJson(element));
          }
          for (var data in productList) {
            searchProductsList.add(data);
          }
          Get.to(() => ProductScreen(
                name: searchProductsList[0].categoryIdList[1],
                parentID: searchProductsList[0].categoryIdList[0].toString(),
              ));
        } else {
          CommonMethods.customizedAlertDialog("No Product!", isPop: false);
        }
      }
    } catch (e) {
      superPrint(e.toString());
    }
    isProductLoading = false;
    update();
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        base64Image = await imageToBase64(imageFile);
        Get.back();
      } else {
        superPrint('No image selected.');
      }
    } catch (e) {
      superPrint('Error picking image: $e');
    }
    update();
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
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
      http.Response response = await ProductService.createProduct(
        base64Image,
        txtName.text,
        txtModel.text,
        txtVendor.text,
        txtBrand.text,
        txtBarcode.text,
        txtSalePrice.text,
        txtCost.text,
        varietyValueMap.values.toList(),
      );
      var result = jsonDecode(response.body);
      CommonMethods.customizedAlertDialog(result['result']['message'],
          isPop: false);
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
