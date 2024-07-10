import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../utils/constant/app_color.dart';

Widget breadcrumbHeadline(
    String name, BuildContext context, String productTitle) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
    child: Container(
      width: productTitle.isEmpty ? 76.w : 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                if (productTitle.isNotEmpty) {
                  Navigator.of(context).pop();
                }
              },
              child: Icon(
                Icons.category_rounded,
                color: AppColor.pinkColor,
                size: 30,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 18,
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: textWidget("Product\nCategories",
                  color: AppColor.pinkColor,
                  fontWeight: FontWeight.bold,
                  size: 13,
                  textAlign: TextAlign.center),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 18,
          ),
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                if (productTitle.isNotEmpty) {
                  Navigator.of(context).pop();
                }
              },
              child: textWidget(name,
                  color: productTitle.isEmpty
                      ? AppColor.primary
                      : AppColor.pinkColor,
                  fontWeight: FontWeight.w800,
                  size: 13,
                  textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(width: 5),
          productTitle.isEmpty
              ? const SizedBox.shrink()
              : const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
          productTitle.isEmpty
              ? const SizedBox.shrink()
              : Expanded(
                  flex: 6,
                  child: textWidget(productTitle,
                      color: AppColor.primary,
                      fontWeight: FontWeight.w800,
                      size: 13,
                      textAlign: TextAlign.center),
                ),
          const SizedBox(width: 10),
        ],
      ),
    ),
  );
}
