import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/commons/super_scaffold.dart';
import '../../../../utils/constant/app_color.dart';
import '../../../widgets/app_bar/global_app_bar.dart';
import '../../../widgets/text_widget.dart';
import '../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../my_request/presentation/widgets/filter_by_date_widget.dart';
import '../my_request/presentation/widgets/search_pending_request_widget.dart';
import '../my_return/presentation/my_return_history/my_return_history_screen.dart';
import '../outlet_return/presentation/outlet_return_history/outlet_return_history_screen.dart';

class GlobalReturnHistoryScreen extends ConsumerStatefulWidget {
  const GlobalReturnHistoryScreen({super.key});

  @override
  ConsumerState<GlobalReturnHistoryScreen> createState() =>
      _GlobalReturnHistoryScreenState();
}

class _GlobalReturnHistoryScreenState
    extends ConsumerState<GlobalReturnHistoryScreen> {
  bool isMyReturn = true;
  TextEditingController txtSearchController = TextEditingController();
  switchMyReturn() {
    setState(() {
      isMyReturn = true;
    });
  }

  switchOutletReturn() {
    setState(() {
      isMyReturn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Returned History",
                  () {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                  },
                ),
                Transform.translate(
                  offset: Offset(0, 14.h),
                  child: pendingRequestWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleTextChanged(String input) {
    setState(() {
      // Example parsing logic: trying to convert input to an integer
    });
  }

  Widget pendingRequestWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          FilterByDateWidget(isMyReturn: isMyReturn),
          SearchPendingRequestWidget(
            txtController: txtSearchController,
            onChanged: handleTextChanged,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    switchMyReturn();
                  },
                  child: Container(
                    width: 43.w,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isMyReturn ? AppColor.pinkColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.dropshadowColor,
                              spreadRadius: 3,
                              blurRadius: 3)
                        ]),
                    child: textWidget(
                      "My Returned",
                      color: isMyReturn ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    switchOutletReturn();
                  },
                  child: Container(
                    width: 43.w,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: !isMyReturn ? AppColor.pinkColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.dropshadowColor,
                              spreadRadius: 3,
                              blurRadius: 3)
                        ]),
                    child: textWidget(
                      "Outlet Returned",
                      color: !isMyReturn ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: isMyReturn
                ? const MyReturnHistoryScreen()
                : const OutletReturnHistoryScreen(),
          ),
        ],
      ),
    );
  }
}
