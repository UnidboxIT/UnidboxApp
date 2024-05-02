import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class CalendarHandymanAssignWidget extends StatelessWidget {
  const CalendarHandymanAssignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 100.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColor.bottomSheetBgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: headWidget()),
              textWidget(
                "Today",
                fontWeight: FontWeight.bold,
                size: 18,
              ),
              Expanded(
                child: ListView(
                  children: [
                    handymanAssignWidget(),
                  ],
                ),
              )
              // ListView(
              //   shrinkWrap: true,
              //   children: [handymanAssignWidget()],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget headWidget() {
    return Container(
      width: 70,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  Widget handymanAssignWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget("09:00 AM"),
        Row(
          children: [
            textWidget("."),
            Expanded(
              child: SizedBox(
                height: 50,
                width: 100.w,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return textWidget("Item $index");
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 20);
                    },
                    itemCount: 10),
              ),
            )
          ],
        )
      ],
    );
  }
}
