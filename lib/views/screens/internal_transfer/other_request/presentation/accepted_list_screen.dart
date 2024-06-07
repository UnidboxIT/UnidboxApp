import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../domain/other_request.dart';
import 'accepted_detail_screen.dart';
import 'widgets/search_other_request_widget.dart';

class AcceptedListScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;

  const AcceptedListScreen({
    super.key,
    required this.otherRequestList,
  });

  @override
  ConsumerState<AcceptedListScreen> createState() => _AcceptedListScreenState();
}

class _AcceptedListScreenState extends ConsumerState<AcceptedListScreen> {
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
                "Accepted List",
                () {
                  Navigator.of(context).pop();
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
    );
  }

  Widget eachAcceptedListWidget() {
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
          Expanded(
              child: AcceptedDetailScreen(
            otherRequestList: widget.otherRequestList,
          )),
        ],
      ),
    );
  }
}
