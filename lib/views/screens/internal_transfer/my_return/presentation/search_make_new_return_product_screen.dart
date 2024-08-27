import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_return/presentation/make_new_my_return_screen.dart';
import '../../../../../utils/commons/common_method.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/text_widget.dart';
import '../../../inventory_tracker/domain/product.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import 'widgets/new_return_scan_search_bar_widget.dart';

class SearchMakeNewReturnProductScreen extends ConsumerStatefulWidget {
  final List<Products> searchProductList;
  const SearchMakeNewReturnProductScreen({
    super.key,
    required this.searchProductList,
  });

  @override
  ConsumerState<SearchMakeNewReturnProductScreen> createState() =>
      _SearchMakeNewReturnProductScreenState();
}

class _SearchMakeNewReturnProductScreenState
    extends ConsumerState<SearchMakeNewReturnProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: const Color(0xffF6F6F6),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xffF6F6F6),
        body: PopScope(
          onPopInvoked: (didPop) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  globalAppBarWidget(
                    "New Return Request",
                    () {
                      ref.read(bottomBarVisibilityProvider.notifier).state =
                          true;
                      Navigator.of(context).pop();
                    },
                  ),
                  Transform.translate(
                    offset: Offset(0, 14.h),
                    child: searchMakeNewReturnWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchMakeNewReturnWidget() {
    return Container(
      width: 100.w,
      height: 84.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const NewReturnSearchAndScanWidget(),
          widget.searchProductList.isEmpty
              ? Expanded(
                  child: Center(
                    child: textWidget("No Product Found!",
                        textAlign: TextAlign.center),
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 10.h),
                      itemCount: widget.searchProductList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 0,
                        childAspectRatio: 0.77,
                      ),
                      itemBuilder: (context, index) {
                        String image = widget.searchProductList[index].imageUrl;
                        String name = widget.searchProductList[index].name;
                        double qty = widget.searchProductList[index].quantity;
                        double price = widget.searchProductList[index].price;
                        double qtyOutStock =
                            widget.searchProductList[index].qtyOutStock;

                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColor.dropshadowColor,
                                      blurRadius: 3,
                                      spreadRadius: 3),
                                ]),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(bottomBarVisibilityProvider
                                            .notifier)
                                        .state = false;
                                    FocusManager.instance.primaryFocus!
                                        .unfocus();
                                    Navigator.of(context, rootNavigator: false)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                MakeNewMyReturnScreen(
                                                    scanProductList: widget
                                                            .searchProductList[
                                                        index])));
                                  },
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 8, right: 8, top: 3.h),
                                        child: Container(
                                          height: 14.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                            image: DecorationImage(
                                                image: image != "false"
                                                    ? NetworkImage(image)
                                                    : const AssetImage(
                                                        "assets/images/app_icon.jpeg",
                                                      )),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 3.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          color: qty > qtyOutStock
                                              ? AppColor.orangeColor
                                              : Colors.red,
                                        ),
                                        alignment: Alignment.center,
                                        child: textWidget(
                                            qty > qtyOutStock
                                                ? "Sufficient Stock"
                                                : "Insufficient Stock",
                                            color: Colors.white,
                                            size: 12.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(bottomBarVisibilityProvider
                                            .notifier)
                                        .state = false;
                                    Navigator.of(context, rootNavigator: false)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                MakeNewMyReturnScreen(
                                                    scanProductList: widget
                                                            .searchProductList[
                                                        index])));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: textWidget(name,
                                        maxLine: 3,
                                        textOverflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        size: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      textWidget("Qty : ${qty.toInt()}",
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          size: 12,
                                          fontWeight: FontWeight.w500),
                                      textWidget(
                                          "\$ ${CommonMethods.twoDecimalPrice(price)}",
                                          textOverflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          size: 12,
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
