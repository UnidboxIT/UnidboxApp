import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';

Widget outletRequestBreadcrumbHeadline(
    BuildContext context, String accepted, String packed) {
  return Consumer(
    builder: (context, ref, child) => Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Container(
        width: accepted.isEmpty && packed.isEmpty
            ? 45.w
            : packed.isEmpty
                ? 75.w
                : 100.w,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  if (accepted == "accepted" && packed == "") {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else if (packed == "packed" && accepted == "accepted") {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else {
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
                  superPrint(accepted);
                  superPrint(packed);

                  if (accepted.isNotEmpty && packed.isNotEmpty) {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  } else if (accepted.isNotEmpty && packed.isEmpty) {
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
                          ref.read(bottomBarVisibilityProvider.notifier).state =
                              true;
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
    ),
  );
}
