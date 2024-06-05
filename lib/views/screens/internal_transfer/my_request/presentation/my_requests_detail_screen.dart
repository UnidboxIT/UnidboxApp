import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';
import '../repository/provider/my_request_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import 'pending_request_list_screen.dart';
import 'widgets/each_product_line_widget.dart';

class MyRequestsDetailScreen extends ConsumerStatefulWidget {
  const MyRequestsDetailScreen({super.key});

  @override
  ConsumerState<MyRequestsDetailScreen> createState() =>
      _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState
    extends ConsumerState<MyRequestsDetailScreen> {
  List<MyRequest> myRequestList = [];
  List<MyRequest> pendingRequestList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myRequestStateNotifierProvider.notifier).getAllMyRequest();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myRequestStateNotifierProvider, (pre, next) {
      if (next is MyRequestLoading) {
        myRequestList = [];
      }
      if (next is MyRequestList) {
        setState(() {
          myRequestList = next.myRequestList;
          for (var data in myRequestList) {
            if (data.intStatus == 'action') {
              pendingRequestList.add(data);
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
                String requestCode = myRequestList[index].name;
                String name = myRequestList[index].userId[1];
                String requestFrom = myRequestList[index].requestToWh[1];
                String status = myRequestList[index].intStatus;
                List<ProductLineId> productList =
                    myRequestList[index].productLineList;
                String currentDate = myRequestList[index].createDate;
                return eachProductLineWidget(requestCode, name, requestFrom,
                    status, currentDate, productList);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: myRequestList.length),
        ),
      ],
    );
  }

  Widget pendingRequestWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PendingRequestListScreen(
                  pendingRequestList: pendingRequestList,
                )));
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
                    "Pending Request",
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
              visible: pendingRequestList.isNotEmpty,
              child: Positioned(
                top: -15,
                right: -10,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.pinkColor,
                  child: textWidget(
                    pendingRequestList.length.toString(),
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
