import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/create_product/widget/product_variety_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/create_product_provider.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/uom.dart';
import '../../repository/state/create_product_state/product_variety_state.dart';
import 'widget/attribute_widget.dart';
import 'widget/camera_widget.dart';
import 'widget/each_create_text_field_widget.dart';
import 'widget/main_product_dropdown.dart';
import 'widget/show_attribute_dropdown.dart';

String base64Image = "";
Uom selectedUomMainProduct = Uom(id: 0, name: '');

class CreateProductScreen extends ConsumerStatefulWidget {
  const CreateProductScreen({super.key});

  @override
  ConsumerState<CreateProductScreen> createState() =>
      _CreateProductScreenState();
}

class _CreateProductScreenState extends ConsumerState<CreateProductScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtModel = TextEditingController();
  TextEditingController txtVendor = TextEditingController();
  TextEditingController txtBrand = TextEditingController();
  TextEditingController txtBarcode = TextEditingController();
  TextEditingController txtSalePrice = TextEditingController();
  TextEditingController txtRetailPrice = TextEditingController();
  TextEditingController txtUom = TextEditingController();
  bool isCreateProductLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedUomMainProduct = Uom(id: 0, name: '');
    // Future.delayed(const Duration(milliseconds: 10), () {
    //   ref.read(uomStateNotifierProvider.notifier).getUom();
    // });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(productVariteyStateNotifierProvider, (pre, next) {
      if (next is ProductVarietyValueMap) {
        setState(() {
          varietyValueMap = next.varietyValueMap;
        });
        superPrint(varietyValueMap);
      }
    });

    ref.listen(createProductStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          isCreateProductLoading = false;
        });
      }
      if (next is Success) {
        setState(() {
          isCreateProductLoading = true;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: createProductWidget(context),
      )),
    );
  }

  Widget createProductWidget(BuildContext context) {
    return Stack(
      children: [
        globalAppBarWidget(
          "Temporary Product",
          () {
            Navigator.of(context).pop();
          },
        ),
        Transform.translate(
          offset: Offset(0, 13.h),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: productBodyWidget(),
          ),
        ),
      ],
    );
  }

  Widget productBodyWidget() {
    return ListView(
      children: [
        const CameraWidget(),
        eachCreateProductTextFieldWidget(
            "Product Name", txtName, "Product Name"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Model", txtModel, "Model"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Vendor", txtVendor, "Vendor"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Brand", txtBrand, "Brand"),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                "Uom",
                fontWeight: FontWeight.bold,
                color: AppColor.pinkColor,
              ),
              const SizedBox(height: 5),
              const MainProductDropdown()
            ],
          ),
        ),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget("Barcode", txtBarcode, "Barcode"),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget(
            "Retail Price (Before GST)", txtRetailPrice, "Retail Price",
            isNumber: true),
        const SizedBox(height: 10),
        eachCreateProductTextFieldWidget(
            "Cost Price (Before GST)", txtSalePrice, "Cost Price",
            isNumber: true),
        const SizedBox(height: 10),
        const AttributeWidget(),
        const SizedBox(height: 10),
        const ProductVarietyWidget(),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10),
          child: buttonWidget(
            "Submit",
            () {
              ref
                  .read(productVariteyStateNotifierProvider.notifier)
                  .addProductVariety(
                    productVarietyIncrement,
                    txtVarietyBarCode.text,
                    selectedUom.name,
                    txtVarietyFactor.text,
                    txtVarietyPrice.text,
                  );
              superPrint(attributeMapList);
              superPrint(varietyValueMap.values.toList());
              txtName.text.isEmpty
                  ? CommonMethods.customizedAlertDialog(
                      "Please enter name", context)
                  : txtModel.text.isEmpty
                      ? CommonMethods.customizedAlertDialog(
                          "Please enter model", context)
                      : txtVendor.text.isEmpty
                          ? CommonMethods.customizedAlertDialog(
                              "Please enter vendor", context)
                          : txtBrand.text.isEmpty
                              ? CommonMethods.customizedAlertDialog(
                                  "Please enter brand", context)
                              : txtBarcode.text.isEmpty
                                  ? CommonMethods.customizedAlertDialog(
                                      "Please enter barcode", context)
                                  : txtRetailPrice.text.isEmpty
                                      ? CommonMethods.customizedAlertDialog(
                                          "Please enter sale price", context)
                                      : txtSalePrice.text.isEmpty
                                          ? CommonMethods.customizedAlertDialog(
                                              "Please enter cost", context)
                                          : txtVarietyFactor.text.isEmpty
                                              ? CommonMethods.customizedAlertDialog(
                                                  "Please enter factor", context)
                                              : txtVarietyPrice.text.isEmpty
                                                  ? CommonMethods.customizedAlertDialog(
                                                      "Please enter price", context)
                                                  : txtVarietyBarCode
                                                          .text.isEmpty
                                                      ? CommonMethods.customizedAlertDialog(
                                                          "Please enter product variety barcode", context)
                                                      : ref.read(createProductStateNotifierProvider.notifier).createEachProduct(
                                                          base64Image,
                                                          txtName.text,
                                                          txtModel.text,
                                                          txtVendor.text,
                                                          txtBrand.text,
                                                          selectedUomMainProduct.name,
                                                          txtBarcode.text,
                                                          txtSalePrice.text,
                                                          txtRetailPrice.text,
                                                          attributeMapList,
                                                          varietyValueMap.values.toList(),
                                                          context);
            },
            isBool: isCreateProductLoading,
          ),
        ),
        SizedBox(height: 20.h)
      ],
    );
  }
}
