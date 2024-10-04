import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/order_receiving/presentation/pending_receiving_screen.dart';
import 'package:unidbox_app/views/screens/order_receiving/presentation/receiving_history_screen.dart';
import 'package:unidbox_app/views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../widgets/app_bar/global_app_bar.dart';
import '../../inventory_tracker/presentation/stock_ordering/check_out_order_detail_screen.dart';
import '../domain/order_receiving.dart';
import '../repository/provider/order_receiving_provider.dart';
import '../repository/state/pending_receiving_state.dart';
import 'widgets/search_order_receiving.dart';

class OrderReceivingScreen extends ConsumerStatefulWidget {
  const OrderReceivingScreen({super.key});

  @override
  ConsumerState<OrderReceivingScreen> createState() =>
      _OrderReceivingScreenState();
}

class _OrderReceivingScreenState extends ConsumerState<OrderReceivingScreen> {
  List<String> receiveTitleList = ["Pending\nReceiving", "Purchase\nHistory"];
  int selectedTitle = 0;
  bool isPendingLoading = false;
  List<OrderReceiving> pendingOrderReceivingList = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(pendingOrderReceivingStateNotifierProvider.notifier)
          .getAllPendingReceiving();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(pendingOrderReceivingStateNotifierProvider, (pre, next) {
      if (next is PendingReceivingLoading) {
        setState(() {
          isPendingLoading = true;
        });
      }
      if (next is PendingReceivingData) {
        setState(() {
          pendingOrderReceivingList = next.pendingReceivingDataList;
          isPendingLoading = false;
        });
      }
    });
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Stack(
              children: [
                globalAppBarWidget(
                  "Orders Receiving",
                  () {
                    ref.read(bottomBarVisibilityProvider.notifier).state = true;
                    Navigator.of(context).pop();
                  },
                ),
                Positioned(
                  right: 5.w,
                  top: 6.5.h,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(bottomBarVisibilityProvider.notifier).state =
                          false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CheckOutOrderDetailScreen(
                            productDetail: Products(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 14.h),
                  child: orderReceivingBodyWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orderReceivingBodyWidget() {
    return Container(
      width: 100.w,
      height: 81.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const SearchOrderReceiving(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTitle = 0;
                      });
                    },
                    child: titleReceivingWidget(receiveTitleList[0], 0)),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTitle = 1;
                      });
                    },
                    child: titleReceivingWidget(receiveTitleList[1], 1))
              ],
            ),
          ),
          Expanded(
            child: selectedTitle == 0
                ? PendingReceivingScreen(
                    isPendingLoading: isPendingLoading,
                    pendingOrderReceivingList: pendingOrderReceivingList,
                  )
                : ReceivingHistoryScreen(
                    isPendingLoading: isPendingLoading,
                    pendingOrderReceivingList: pendingOrderReceivingList,
                  ),
          )
        ],
      ),
    );
  }

  Widget titleReceivingWidget(String title, int index) {
    return Container(
      width: 42.w,
      height: 6.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: selectedTitle == index ? AppColor.pinkColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 3,
              blurRadius: 3,
            ),
          ]),
      child: textWidget(
        title,
        fontWeight: FontWeight.w700,
        color: selectedTitle == index ? Colors.white : Colors.black,
        size: 14,
        textAlign: TextAlign.center,
      ),
    );
  }
}
