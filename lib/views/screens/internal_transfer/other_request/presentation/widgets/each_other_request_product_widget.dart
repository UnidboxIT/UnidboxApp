// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../../../../../utils/constant/app_color.dart';
// import '../../../../../widgets/button/button_widget.dart';
// import '../../../../../widgets/text_widget.dart';
// import '../../../my_request/domain/my_request.dart';
// import '../../repository/provider/other_request_provider.dart';

// Widget eachOtherRequestProductLineWidget(
//     String requestCode,
//     String name,
//     String currentDate,
//     List<ProductLineId> productList,
//     WidgetRef ref,
//     bool requestLoading) {
//   return ListView.separated(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: AppColor.bgColor,
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColor.dropshadowColor,
//                   blurRadius: 2,
//                   spreadRadius: 2,
//                   offset: const Offset(0, 2),
//                 )
//               ],
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     textWidget(
//                       requestCode,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.black,
//                       size: 20,
//                     ),
//                     textWidget(
//                         DateFormat('dd MMM yyyy').format(
//                           DateTime.parse(currentDate),
//                         ),
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         size: 17)
//                   ],
//                 ),
//                 const SizedBox(height: 13),
//                 Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: AppColor.dropshadowColor,
//                             blurRadius: 3,
//                             spreadRadius: 3,
//                             offset: const Offset(0, 3),
//                           )
//                         ],
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                             image: productList[index].imageUrl != "false"
//                                 ? NetworkImage(productList[index].imageUrl)
//                                 : const AssetImage(
//                                     'assets/images/app_icon.jpeg'),
//                             fit: BoxFit.cover),
//                       ),
//                       height: 12.h,
//                       width: 22.w,
//                     ),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           textWidget(productList[index].productIdList[1],
//                               size: 15,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               maxLine: 2,
//                               textOverflow: TextOverflow.fade,
//                               textAlign: TextAlign.left),
//                           textWidget(productList[index].code,
//                               size: 12,
//                               color: Colors.black.withOpacity(0.6),
//                               fontWeight: FontWeight.w500),
//                           textWidget(
//                             productList[index].model,
//                             fontWeight: FontWeight.w500,
//                             size: 12,
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               addMinusIconButtonWidget(
//                                 CupertinoIcons.minus_circle_fill,
//                               ),
//                               const SizedBox(width: 10),
//                               textWidget(productList[index].qty.toString(),
//                                   color: AppColor.primary,
//                                   fontWeight: FontWeight.bold,
//                                   size: 13),
//                               const SizedBox(width: 10),
//                               addMinusIconButtonWidget(
//                                 CupertinoIcons.add_circled_solid,
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         textWidget(
//                           "Request from",
//                           color: AppColor.orangeColor,
//                           size: 12.5,
//                         ),
//                         textWidget(
//                           productList[index].requestWarehouse[1],
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           size: 14,
//                         ),
//                         textWidget(
//                           name,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           size: 14,
//                         )
//                       ],
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       height: 35,
//                       width: 30.w,
//                       child: buttonWidget("Accept", () {
//                         ref
//                             .read(otherRequestStateNotifierProvider.notifier)
//                             .acceptOtherRequest(productList[index].id, 0);
//                       }, isBool: requestLoading),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       separatorBuilder: (context, index) {
//         return const SizedBox(height: 20);
//       },
//       itemCount: productList.length);
// }

// String capitalizeFirstLetter(String word) {
//   if (word.isEmpty) {
//     return word; // Return empty string if input is empty
//   }
//   return word[0].toUpperCase() + word.substring(1);
// }

// Widget addMinusIconButtonWidget(IconData iconData) {
//   return Icon(
//     iconData,
//     color: AppColor.pinkColor,
//     size: 18,
//   );
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../utils/constant/app_color.dart';
import '../../../../../widgets/button/button_widget.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_request/presentation/widgets/each_product_line_widget.dart';
import '../../repository/provider/other_request_provider.dart';

Widget eachAcceptedDataWiget(String code, String name, String currentDate,
    ProductLineId productLine, WidgetRef ref,
    {bool isAcceptLoading = false, int acceptProductID = -1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.bgColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.dropshadowColor,
            blurRadius: 2,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                code,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                size: 20,
              ),
              textWidget(
                  DateFormat('dd MMM yyyy').format(
                    DateTime.parse(currentDate),
                  ),
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  size: 17)
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.dropshadowColor,
                      blurRadius: 3,
                      spreadRadius: 3,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: productLine.imageUrl != "false"
                          ? NetworkImage(productLine.imageUrl)
                          : const AssetImage('assets/images/app_icon.jpeg'),
                      fit: BoxFit.cover),
                ),
                height: 12.h,
                width: 22.w,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(productLine.productIdList[1],
                        size: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        maxLine: 2,
                        textOverflow: TextOverflow.fade,
                        textAlign: TextAlign.left),
                    textWidget(productLine.code,
                        size: 12,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w500),
                    textWidget(
                      productLine.model,
                      fontWeight: FontWeight.w500,
                      size: 12,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        addMinusIconButtonWidget(
                          CupertinoIcons.minus_circle_fill,
                        ),
                        const SizedBox(width: 10),
                        textWidget(productLine.qty.toString(),
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold,
                            size: 13),
                        const SizedBox(width: 10),
                        addMinusIconButtonWidget(
                          CupertinoIcons.add_circled_solid,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                    "Request from",
                    color: AppColor.orangeColor,
                    size: 12.5,
                  ),
                  textWidget(
                    productLine.requestWarehouse[1],
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 14,
                  ),
                  textWidget(
                    name,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 14,
                  )
                ],
              ),
              const Spacer(),
              Visibility(
                visible: productLine.status == 'accepted',
                child: SizedBox(
                  height: 35,
                  width: 30.w,
                  child: buttonWidget("Pack", () {
                    ref
                        .read(otherRequestStateNotifierProvider.notifier)
                        .packOtherRequest(productLine.id, 0);
                  },
                      isBool:
                          isAcceptLoading && acceptProductID == productLine.id),
                ),
              ),
              Visibility(
                visible: productLine.status == 'requested',
                child: SizedBox(
                  height: 35,
                  width: 30.w,
                  child: buttonWidget("Accept", () {
                    ref
                        .read(otherRequestStateNotifierProvider.notifier)
                        .acceptOtherRequest(productLine.id, 0);
                  },
                      isBool:
                          isAcceptLoading && acceptProductID == productLine.id),
                ),
              ),
              Visibility(
                visible: productLine.status == 'packed',
                child: SizedBox(
                  height: 35,
                  width: 30.w,
                  child: buttonWidget(
                    "Packed",
                    () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}