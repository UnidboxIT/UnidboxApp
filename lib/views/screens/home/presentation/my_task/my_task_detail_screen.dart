import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/home/domain/my_task.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/presentation/inventory_tracker_screen.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../bottom_nav/presentation/bottom_nav_bar.dart';
import '../../../bottom_nav/repository/bottom_nav_state_notifier.dart';
import '../../../internal_transfer/internal_transfer/presentation/internal_transfer_screen.dart';
import '../../../order_receiving/presentation/order_receiving_screen.dart';
import '../home_screen.dart';

class MyTaskDetailScreen extends ConsumerStatefulWidget {
  final String name;
  final String parentID;
  final List<MyTask> myTaskDetail;
  const MyTaskDetailScreen({
    super.key,
    required this.parentID,
    required this.name,
    required this.myTaskDetail,
  });

  @override
  ConsumerState<MyTaskDetailScreen> createState() => _MyTaskDetailScreenState();
}

class _MyTaskDetailScreenState extends ConsumerState<MyTaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomNavNotifierControllerProvider);
    final bottomNavNotifier =
        ref.watch(bottomNavNotifierControllerProvider.notifier);
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(widget.name, () {
                Navigator.of(context).pop();
              }),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: mytaskDetailBodyWidget(),
              ),
            ],
          ),
        ),
        floatingActionButton: floatingActionBottomWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavBarWidget(
            currentIndex, bottomNavNotifier, ref, context,
            needControl: true),
      ),
    );
  }

  Widget mytaskDetailBodyWidget() {
    return Container(
      width: 100.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4.h),
      child: detailListViewWidget(),
    );
  }

  Widget detailListViewWidget() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.myTaskDetail.length,
        itemBuilder: (context, index) {
          var task = widget.myTaskDetail[index];
          return GestureDetector(
            onTap: () {
              switch (task.name) {
                case "Inventory Tracker":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const InventoryTrackerScreen()));
                  break;
                case "Internal Transfer":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InternalTransferScreen(
                          internalTransferList:
                              myTaskDetailMap[task.id] ?? [])));
                  break;
                case "Order Receiving":
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrderReceivingScreen()));
                  break;
              }
            },
            child: eachMyTaskDetailWidget(
              task.imageUrl,
              task.name,
              "3",
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 2.5.h);
        });
  }

  Widget eachMyTaskDetailWidget(String image, String name, String count) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 20.h,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColor.dropshadowColor,
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: const Offset(-3, 3)),
              ]),
          child: Row(
            children: [
              Image.network(
                image,
                width: 50.w,
                height: 14.h,
              ),
              SizedBox(
                width: 23.w,
                child: textWidget(name, size: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          right: -5,
          child: CircleAvatar(
            backgroundColor: AppColor.pinkColor,
            radius: 19,
            child: textWidget(
              count,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: 13,
            ),
          ),
        ),
      ],
    );
  }
}