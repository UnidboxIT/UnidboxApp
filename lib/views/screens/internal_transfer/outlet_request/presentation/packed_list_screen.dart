import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/internal_transfer/outlet_request/presentation/packed_detail_screen.dart';
import '../../../../../utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../domain/other_request.dart';

import 'widgets/search_other_request_widget.dart';

class PackedListScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;

  const PackedListScreen({
    super.key,
    required this.otherRequestList,
  });

  @override
  ConsumerState<PackedListScreen> createState() => _PackedListScreenState();
}

class _PackedListScreenState extends ConsumerState<PackedListScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.primary,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Packed List",
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
      height: 83.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchOtherRequestWidget(),
          Expanded(
              child: PackedDetailScreen(
            otherRequestList: widget.otherRequestList,
          )),
        ],
      ),
    );
  }
}
