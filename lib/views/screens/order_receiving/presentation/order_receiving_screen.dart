import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/domain/product.dart';
import 'package:unidbox_app/views/screens/system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../../widgets/app_bar/global_app_bar.dart';
import '../../inventory_tracker/presentation/stock_ordering/check_out_order_detail_screen.dart';
import 'widgets/search_order_receiving.dart';

class OrderReceivingScreen extends ConsumerStatefulWidget {
  const OrderReceivingScreen({super.key});

  @override
  ConsumerState<OrderReceivingScreen> createState() =>
      _OrderReceivingScreenState();
}

class _OrderReceivingScreenState extends ConsumerState<OrderReceivingScreen> {
  @override
  Widget build(BuildContext context) {
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
                            stockOrderList: const [],
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
      child: const Column(
        children: [
          SearchOrderReceiving(),
        ],
      ),
    );
  }
}
