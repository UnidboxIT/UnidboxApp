import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../outlet_request/presentation/widgets/search_other_request_widget.dart';

class OutletReturnScreen extends ConsumerStatefulWidget {
  const OutletReturnScreen({super.key});

  @override
  ConsumerState<OutletReturnScreen> createState() => _OutletReturnScreenState();
}

class _OutletReturnScreenState extends ConsumerState<OutletReturnScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Outlet Return",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(65.w, 6.h),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColor.orangeColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: textWidget("Returned\nHistory",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          size: 17,
                          textAlign: TextAlign.center)),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: outletReturnWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget outletReturnWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchOtherRequestWidget(),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
