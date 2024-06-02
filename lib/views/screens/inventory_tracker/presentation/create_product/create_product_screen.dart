import 'dart:convert';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/create_product/widget/product_variety_widget.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/create_product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/main_uom_state.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../widgets/bottom_sheets/global_bottom_sheet.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/uom.dart';
import '../../repository/state/create_product_state/create_product_state.dart';
import 'widget/attribute_widget.dart';
import 'widget/each_create_text_field_widget.dart';
import 'widget/show_attribute_dropdown.dart';
import 'dart:math' as math;

List varietyIncrementValueList = [];

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
  bool isUpdateLoading = false;
  File imageFile = File("");
  final ImagePicker picker = ImagePicker();
  String base64Image = "";
  TextEditingController txtSearch = TextEditingController();
  List<Uom> uomList = [];
  Uom selectedUomMainProduct = Uom(id: 0, name: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    varietyIncrementValueList.clear();
    selectedUomMainProduct = Uom(id: 0, name: '');
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(mainUomStateNotifierProvider.notifier).getMainUom();
    });
    loadData();
  }

  loadData() {
    selectedUom = Uom(id: 0, name: '');
    txtVarietyBarCode.clear();
    txtVarietyFactor.clear();
    txtVarietyPrice.clear();
    ref
        .read(productVariteyStateNotifierProvider.notifier)
        .clearProductVarietyMap();
    productVarietyIncrement = 1;
    varietyIncrementValueList.add(1);
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(uomStateNotifierProvider.notifier).getUom();
    });
  }

  updateSelectedUom(values) {
    if (values != null) {
      setState(() {
        selectedUomMainProduct = values;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(createProductStateNotifierProvider, (pre, next) {
      if (next is LoadingProduct) {
        setState(() {
          isCreateProductLoading = false;
        });
      }

      if (next is SuccessCreateProduct) {
        setState(() {
          isCreateProductLoading = true;
        });
      }
    });

    ref.listen(mainUomStateNotifierProvider, (pre, next) {
      if (next is LoadingMainUom) {
        setState(() {
          uomList = [];
        });
      }
      if (next is MainUomList) {
        setState(() {
          uomList = next.uomList;
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
    superPrint(base64Image);
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
        cameraWidget(),
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
              uomMainProductWidget()
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

  Widget cameraWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () {
              imageUploadBottomSheet(context);
            },
            child: Container(
              width: 100.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.dropshadowColor,
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ],
              ),
              child: imageFile.path.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.fill,
                      ),
                    )
                  : const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
            ),
          ),
          IconButton(
              onPressed: () {
                // clearSelectedImage();
                superPrint("Icon Button");
              },
              icon: const Icon(
                CupertinoIcons.delete,
                size: 18,
              ))
        ],
      ),
    );
  }

  imageUploadBottomSheet(BuildContext context) {
    return globalBottomSheet(
        Container(
          height: 25.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: const Color(0xffD8EDE5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageIconWidget(() {
                pickImage(ImageSource.gallery, context, ref);
              }, "Upload", Icons.logout),
              imageIconWidget(() {
                pickImage(ImageSource.camera, context, ref);
              }, "Use camera", Icons.camera_enhance),
            ],
          ),
        ),
        context);
  }

  Widget imageIconWidget(
      VoidCallback onPressed, String text, IconData iconData) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      spreadRadius: 5)
                ]),
            child: text == "Upload"
                ? Transform.rotate(
                    angle: -math.pi / 2,
                    child: Icon(
                      iconData,
                      color: AppColor.orangeColor,
                    ),
                  )
                : Icon(
                    iconData,
                    color: AppColor.pinkColor,
                  ),
          ),
          const SizedBox(height: 10),
          textWidget(text, fontWeight: FontWeight.bold)
        ],
      ),
    );
  }

  Future<void> pickImage(ImageSource source, context, WidgetRef ref) async {
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        String image64 = await imageToBase64(imageFile);
        base64Image = image64;
        ref
            .read(createProductStateNotifierProvider.notifier)
            .saveImage(base64Image);
        final state = ref.watch(createProductStateNotifierProvider);
        if (state is SaveImageBase64) {
          setState(() {
            base64Image = state.image;
          });
        }
        Navigator.of(context).pop();
      } else {
        superPrint('No image selected.');
      }
    } catch (e) {
      superPrint('Error picking image: $e');
    }
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  Widget uomMainProductWidget() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Uom>(
        isExpanded: true,
        autofocus: true,
        isDense: true,
        hint: Text(
          'Uom',
          style: TextStyle(
              fontSize: 13,
              color: AppColor.fontColor.withOpacity(0.6),
              fontWeight: FontWeight.w500),
        ),
        items: uomList
            .map((item) => DropdownMenuItem<Uom>(
                  value: item,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value:
            selectedUomMainProduct.name.isEmpty ? null : selectedUomMainProduct,
        onChanged: (value) {
          updateSelectedUom(value);
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 30.h,
          decoration: BoxDecoration(
            color: AppColor.bottomSheetBgColor,
            borderRadius: BorderRadius.circular(8),
          ),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: WidgetStatePropertyAll(AppColor.primary),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: txtSearch,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: TextFormField(
              autofocus: false,
              expands: true,
              maxLines: null,
              controller: txtSearch,
              textInputAction: TextInputAction.done,
              style: TextStyle(
                fontSize: 13,
                color: AppColor.fontColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search nationality',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.bgColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.primary)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColor.dropshadowColor)),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            txtSearch.clear();
          }
        },
      ),
    );
  }
}
