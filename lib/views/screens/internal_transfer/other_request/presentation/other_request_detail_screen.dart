import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/domain/other_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/provider/other_request_provider.dart';
import 'package:unidbox_app/views/screens/internal_transfer/other_request/repository/state/other_request_state.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../my_request/domain/my_request.dart';
import 'widgets/each_other_request_product_widget.dart';

class OtherRequestDetailScreen extends ConsumerStatefulWidget {
  final List<OtherRequest> otherRequestList;
  final List<OtherRequest> acceptRequestList;
  const OtherRequestDetailScreen(
      {super.key,
      required this.otherRequestList,
      required this.acceptRequestList});

  @override
  ConsumerState<OtherRequestDetailScreen> createState() =>
      _OtherRequestsDetailScreenState();
}

class _OtherRequestsDetailScreenState
    extends ConsumerState<OtherRequestDetailScreen> {
  List<OtherRequest> otherRequestList = [];
  List<OtherRequest> acceptRequestList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      otherRequestList = widget.otherRequestList;
      acceptRequestList = widget.acceptRequestList;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(otherRequestStateNotifierProvider, (pre, next) {
      if (next is OtherRequestLoading) {
        otherRequestList = [];
      }
      if (next is OtherRequestList) {
        setState(() {
          otherRequestList = next.otherRequestList;
          for (var data in otherRequestList) {
            if (data.intStatus == 'progress') {
              acceptRequestList.add(data);
            }
          }
        });
      }
    });
    return myrequestDetailWidget();
  }

  Widget myrequestDetailWidget() {
    return Column(
      children: [
        pendingRequestWidget(),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 20),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String requestCode = otherRequestList[index].name;
                String name = otherRequestList[index].userId[1];
                String requestFrom = otherRequestList[index].requestToWh.isEmpty
                    ? ""
                    : otherRequestList[index].requestToWh[1];
                String status = otherRequestList[index].intStatus;

                List<ProductLineId> productList =
                    otherRequestList[index].productLineList;
                String currentDate = otherRequestList[index].createDate;
                return eachOtherRequestProductLineWidget(
                  requestCode,
                  name,
                  requestFrom,
                  status,
                  currentDate,
                  productList,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: otherRequestList.length),
        ),
      ],
    );
  }

  Widget pendingRequestWidget() {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => PendingRequestListScreen(
        //           pendingRequestList: pendingRequestList,
        //         )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.bottomSheetBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textWidget(
                    "Accepted List",
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ],
              ),
            ),
            Visibility(
              visible: acceptRequestList.isNotEmpty,
              child: Positioned(
                top: -15,
                right: -10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.pinkColor,
                  child: textWidget(
                    acceptRequestList.length.toString(),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
