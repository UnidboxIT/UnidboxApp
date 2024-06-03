import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/domain/my_request.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/state/my_request_state.dart';

import '../repository/provider/my_request_provider.dart';
import 'widgets/each_request_widget.dart';

class MyRequestsDetailScreen extends ConsumerStatefulWidget {
  const MyRequestsDetailScreen({super.key});

  @override
  ConsumerState<MyRequestsDetailScreen> createState() =>
      _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState
    extends ConsumerState<MyRequestsDetailScreen> {
  List<MyRequest> myRequestList = [];
  @override
  void initState() {
    // TODO: implement initState
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
        });
      }
    });
    return SuperScaffold(
      child: Scaffold(
        body: myrequestDetailWidget(),
      ),
    );
  }

  Widget myrequestDetailWidget() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          String requestCode = "REQ#234";
          String urgent = "Urgent";
          String name = myRequestList[index].userId[1];
          String requestFrom = myRequestList[index].requestFromWh[1];
          String status = myRequestList[index].intStatus;
          List<ProductLineId> productList =
              myRequestList[index].productLineList;
          return eachMyRequestWidget(
              requestCode, urgent, name, requestFrom, status, productList);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: myRequestList.length);
  }
}
