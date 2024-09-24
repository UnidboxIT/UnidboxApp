import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/presentation/accepted_detail_screen.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../domain/other_request.dart';

import 'outlet_request_breadcumbs_heacline/outlet_request_breadcrumbs_headline_widget.dart';
import 'widgets/search_other_request_widget.dart';

class AcceptedListScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;

  const AcceptedListScreen({
    super.key,
    required this.otherRequestList,
  });

  @override
  ConsumerState<AcceptedListScreen> createState() => _PackedListScreenState();
}

class _PackedListScreenState extends ConsumerState<AcceptedListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(bottomBarVisibilityProvider.notifier).state = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.primary,
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
                  "Accepted List",
                  () {
                    Navigator.of(context).pop();
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                  },
                ),
                Transform.translate(
                  offset: Offset(0, 14.h),
                  child: eachAcceptedListWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget eachAcceptedListWidget() {
    return Container(
      width: 100.w,
      height: Platform.isIOS ? 80.h : 81.5.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchOtherRequestWidget(),
          outletRequestBreadcrumbHeadline(context, "accepted"),
          Expanded(
            child: AcceptedDetailScreen(
              otherRequestList: widget.otherRequestList,
            ),
          ),
        ],
      ),
    );
  }
}
