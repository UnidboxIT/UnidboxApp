import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/restock_ordering_provider.dart';
import 'package:unidbox_app/views/user_warehouse/domain/user_warehouse.dart';
import '../../../../../../../../utils/constant/app_color.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/product.dart';
import '../restock_product_popup/restock_product_popup_widget.dart';

Widget inventoryAppBarWidget(
  String name,
  VoidCallback onPressed,
  VoidCallback iconOnPressed,
  IconData iconData,
  BuildContext context, {
  bool isInternalTransfer = true,
}) {
  return Container(
    height: 20.h,
    width: 100.w,
    decoration: BoxDecoration(color: AppColor.primary),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            height: 60,
            width: 70.w,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    color: Colors.transparent,
                    child: textWidget(
                      name,
                      fontWeight: FontWeight.w900,
                      size: 23,
                      color: Colors.white,
                      textAlign: TextAlign.left,
                      maxLine: 1,
                    ),
                  ),
                ),
              ),
              // Flexible(
              //   child: textWidget(
              //     name,
              //     fontWeight: FontWeight.w900,
              //     size: 23,
              //     color: Colors.white,
              //     textAlign: TextAlign.left,
              //     maxLine: 1,
              //     textOverflow: TextOverflow.ellipsis,
              //   ),
              // ),

              Visibility(
                visible: isInternalTransfer,
                child: IconButton(
                  onPressed: iconOnPressed,
                  icon: Icon(
                    iconData,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget productDetailAppBarWidget(
    String name,
    VoidCallback onPressed,
    VoidCallback iconOnPressed,
    IconData iconData,
    BuildContext context,
    Products productDetail,
    UserWarehouse userWarehouse,
    WidgetRef ref) {
  return Container(
    height: 20.h,
    width: 100.w,
    decoration: BoxDecoration(color: AppColor.primary),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            height: 60,
            width: 70.w,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    color: Colors.transparent,
                    child: textWidget(
                      name,
                      fontWeight: FontWeight.w900,
                      size: 23,
                      color: Colors.white,
                      textAlign: TextAlign.left,
                      maxLine: 1,
                    ),
                  ),
                ),
              ),
              // Flexible(
              //   child: textWidget(
              //     name,
              //     fontWeight: FontWeight.w900,
              //     size: 23,
              //     color: Colors.white,
              //     textAlign: TextAlign.left,
              //     maxLine: 1,
              //     textOverflow: TextOverflow.ellipsis,
              //   ),
              // ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  ref
                      .read(restockOrderStateNotifierProvider.notifier)
                      .getReorder(
                          productDetail.id, userWarehouse.warehouseList[0]);
                  restockProductPopUpWidget(
                      context, productDetail, userWarehouse);
                },
                icon: const Icon(
                  Icons.drive_folder_upload_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              IconButton(
                onPressed: iconOnPressed,
                icon: Icon(
                  iconData,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
