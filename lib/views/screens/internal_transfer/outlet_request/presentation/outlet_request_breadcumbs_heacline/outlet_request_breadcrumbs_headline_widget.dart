import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../../utils/constant/app_color.dart';

Widget outletRequestBreadcrumbHeadline(
    BuildContext context, String accepted, String packed) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
    child: Container(
      width: accepted.isEmpty && packed.isEmpty
          ? 45.w
          : packed.isEmpty
              ? 75.w
              : 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                if (accepted.isNotEmpty && packed.isEmpty) {
                  Navigator.of(context).pop();
                } else if (packed.isNotEmpty && accepted.isNotEmpty) {
                  Navigator.of(context).pop();
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
            flex: 4,
            child: GestureDetector(
              onTap: () {
                if (accepted.isNotEmpty) {
                  Navigator.of(context).pop();
                }
              },
              child: textWidget("Outlet\nRequest",
                  color: accepted.isNotEmpty
                      ? AppColor.pinkColor
                      : AppColor.primary,
                  fontWeight: FontWeight.bold,
                  size: 14,
                  textAlign: TextAlign.center),
            ),
          ),
          accepted.isEmpty
              ? const SizedBox.shrink()
              : const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
          accepted.isEmpty
              ? const SizedBox.shrink()
              : Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () {
                      if (packed.isNotEmpty) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: textWidget("Accepted\nList",
                        color: packed.isEmpty
                            ? AppColor.primary
                            : AppColor.pinkColor,
                        fontWeight: FontWeight.w800,
                        size: 14,
                        textAlign: TextAlign.center),
                  ),
                ),
          packed.isEmpty
              ? const SizedBox.shrink()
              : const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 18,
                ),
          packed.isEmpty
              ? const SizedBox.shrink()
              : Expanded(
                  flex: 5,
                  child: textWidget("Packed\nList",
                      color: AppColor.primary,
                      fontWeight: FontWeight.w800,
                      size: 14,
                      textAlign: TextAlign.center),
                ),
        ],
      ),
    ),
  );
}
