import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../../utils/constant/app_color.dart';
import '../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../user_warehouse/provider/user_warehouse_provider.dart';
import '../../../../user_warehouse/state/user_warehouse_state.dart';
import '../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../widgets/button/button_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../inventory_tracker/domain/inhouse_stock.dart';
import '../../../inventory_tracker/domain/product.dart';
import '../../../inventory_tracker/repository/provider/inhouse_stock_provider.dart';
import '../../../inventory_tracker/repository/state/inhouse_stock_state.dart';
import '../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../my_request/domain/return_request_reason.dart';
import '../../my_request/presentation/return_request_screen.dart';
import '../repository/provider/my_return_provider.dart';
import '../repository/state/my_return_reason_state.dart';
import '../repository/state/my_return_state.dart';
import 'widgets/make_new_return_reason_widget.dart';
import 'widgets/scan_search_bar_widget.dart';

class MakeNewMyReturnScreen extends ConsumerStatefulWidget {
  final List<Products> scanProductList;
  const MakeNewMyReturnScreen({super.key, required this.scanProductList});

  @override
  ConsumerState<MakeNewMyReturnScreen> createState() =>
      _UpdateMyReturnScreenState();
}

class _UpdateMyReturnScreenState extends ConsumerState<MakeNewMyReturnScreen>
    with WidgetsBindingObserver {
  List<ReturnRequestReason> myReturnReason = [];
  List<int> reasonIndex = [];
  bool isMyReturnUpdate = false;
  bool isWarehouseLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();
  List<InhouseStock> inHouseStockList = [];
  List<InhouseStock> filterWareHouseList = [];
  int requestWarehouseID = -1;
  int totalQty = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(userWarehouseStateNotifierProvider.notifier)
          .getUserWarehouse()
          .then((_) {
        ref
            .read(inhouseStockStateNotifierProvider.notifier)
            .getInHouseStock(widget.scanProductList.first.id, context);
      });
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      ref
          .read(myReturnReasonStateNotifierProvider.notifier)
          .getAllMyReturnReason();
    });
    reasonQtyMap.clear();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userWarehouseStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        setState(() {
          isWarehouseLoading = true;
        });
      }
      if (next is UserWarehouseData) {
        setState(() {
          userWarehouse = next.warehouse;
          isWarehouseLoading = false;
        });
      }
    });

    ref.listen(myReturnReasonStateNotifierProvider, (pre, next) {
      if (next is MyReturnReasonLoading) {
        setState(() {
          myReturnReason = [];
        });
      }
      if (next is MyReturnReasonList) {
        setState(() {
          myReturnReason = next.myReturnReasonList;
          isMyReturnUpdate = false;
        });
      }
    });
    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnUpdateLoading) {
        setState(() {
          isMyReturnUpdate = true;
        });
      }
      if (next is MyReturnError) {
        setState(() {
          isMyReturnUpdate = false;
        });
      }
      if (next is MyReturnUpdateSuccess) {
        setState(() {
          isMyReturnUpdate = false;
        });
      }
    });
    ref.listen(inhouseStockStateNotifierProvider, (pre, next) {
      if (next is SelectedWarehouseID) {
        setState(() {
          requestWarehouseID = next.warehouseID;
        });
      }
      if (next is InhouseStockList) {
        setState(() {
          inHouseStockList = next.inhouseStock;
          filterWareHouseList = inHouseStockList
              .where((stock) =>
                  userWarehouse.warehouseList[0] != stock.warehouseList[0] &&
                  double.parse(stock.qty) > 0)
              .toList();
          if (filterWareHouseList.isNotEmpty) {
            requestWarehouseID = filterWareHouseList.first.warehouseList[0];
            superPrint(requestWarehouseID);
          }
        });
      }
    });
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
                    child: editMyReturnWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget editMyReturnWidget() {
    return Container(
      width: 100.w,
      height: 84.h,
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          scanSearchBarWidget(),
          Expanded(child: returnRequestWidget()),
        ],
      ),
    );
  }

  Widget returnRequestWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColor.bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ],
              ),
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.dropshadowColor,
                              blurRadius: 3,
                              spreadRadius: 3,
                              offset: const Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: widget.scanProductList[0].imageUrl != "false"
                                ? NetworkImage(
                                    widget.scanProductList[0].imageUrl)
                                : const AssetImage(
                                    'assets/images/app_icon.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 14.5.h,
                        width: 25.w,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: textWidget(
                                  widget.scanProductList[0].fullName,
                                  fontWeight: FontWeight.w700,
                                  size: 14,
                                  color: Colors.black,
                                  textOverflow: TextOverflow.fade,
                                  textAlign: TextAlign.left),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: textWidget(
                                  widget.scanProductList[0].defaultCode,
                                  size: 13),
                            ),
                            const SizedBox(height: 20),
                            textWidget(
                                DateFormat('dd MMM yyyy').format(
                                  DateTime.parse(
                                      widget.scanProductList[0].createDate),
                                ),
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                size: 17),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: textWidget(
                      "Return To",
                      color: AppColor.orangeColor,
                      size: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  returnToAllWarehouseWidget(),
                  textWidget(
                    "Returned Request By",
                    size: 13,
                    color: AppColor.orangeColor,
                    fontWeight: FontWeight.w500,
                  ),
                  textWidget(
                    userWarehouse.warehouseList.isEmpty
                        ? ""
                        : userWarehouse.warehouseList[1],
                    size: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  textWidget(
                    "Reason",
                    size: 13,
                    color: AppColor.orangeColor,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 5),
                  returnReasonWidget(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 35.w,
                          height: 43,
                          child: buttonWidget(
                            "Cancel",
                            () {
                              Navigator.of(context).pop();
                            },
                            fontColor: AppColor.primary,
                          ),
                        ),
                        SizedBox(
                          width: 35.w,
                          height: 43,
                          child: buttonWidget(
                            "Send Request",
                            () {
                              superPrint(sumNewReturnQty);
                              superPrint(reasonIndex);
                              superPrint(txtNewReturnComment.text);
                              ref
                                  .read(myReturnStateNotifierProvider.notifier)
                                  .updateMyReturn(
                                      userWarehouse.warehouseList[0],
                                      requestWarehouseID,
                                      widget.scanProductList[0].id,
                                      widget.scanProductList[0].name,
                                      sumNewReturnQty,
                                      widget.scanProductList[0].price,
                                      widget.scanProductList[0].uomList[0],
                                      reasonIndex,
                                      txtNewReturnComment.text,
                                      context,
                                      ref)
                                  .then((_) {
                                Navigator.of(context).pop();
                              });
                            },
                            isBool: isMyReturnUpdate,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

  Widget returnReasonWidget() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // int sumRecevieQty = reasonQtyMap.values.fold(
                    //     0, (previousValue, element) => previousValue + element);
                    if (!reasonIndex.contains(myReturnReason[index].id)) {
                      // if (widget.scanProductList.first.quantity >
                      //     sumRecevieQty) {
                      reasonIndex.add(myReturnReason[index].id);
                      // }
                    } else {
                      reasonQtyMap.remove(myReturnReason[index].id);
                      reasonIndex.remove(myReturnReason[index].id);
                    }
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Icon(
                        reasonIndex.contains(myReturnReason[index].id)
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      textWidget(
                        myReturnReason[index].reason,
                        fontWeight: FontWeight.w700,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: reasonIndex.contains(myReturnReason[index].id),
                child: MakeNewReturnReasonWidget(
                  reasonIndex: myReturnReason[index].id,
                  reasonIndexList: reasonIndex,
                  returnRequestReasonList: myReturnReason,
                  receiveQty: widget.scanProductList[0].quantity,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: myReturnReason.length);
  }

  Widget returnToAllWarehouseWidget() {
    return SizedBox(
      height: inHouseStockList.length > 3 ? 17.h : 7.h,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              // textWidget(
              //   inHouseStockList[index].warehouseList[1],
              //   color: AppColor.orangeColor,
              //   fontWeight: FontWeight.w600,
              // ),
              GestureDetector(
                onTap: () {
                  superPrint(inHouseStockList[index].warehouseList);
                  if (widget
                      .scanProductList.first.defaultWarehouseList.isEmpty) {
                    ref
                        .read(inhouseStockStateNotifierProvider.notifier)
                        .selectedWarehouseID(
                            inHouseStockList[index].warehouseList[0],
                            double.parse(inHouseStockList[index].qty).toInt());
                  } else if (widget.scanProductList.first.defaultWarehouseList
                          .isNotEmpty &&
                      widget.scanProductList.first.defaultWarehouseList[0] !=
                          userWarehouse.warehouseList[0]) {
                    ref
                        .read(inhouseStockStateNotifierProvider.notifier)
                        .selectedWarehouseID(
                            inHouseStockList[index].warehouseList[0],
                            double.parse(inHouseStockList[index].qty).toInt());
                  }
                },
                child: widget.scanProductList.first.defaultWarehouseList
                            .isNotEmpty &&
                        widget.scanProductList.first.defaultWarehouseList[0] ==
                            userWarehouse.warehouseList[0]
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.dropshadowColor,
                                  blurRadius: 3,
                                  spreadRadius: 3),
                            ]),
                        alignment: Alignment.center,
                        child:
                            textWidget(inHouseStockList[index].warehouseList[1],
                                // double.parse(
                                //         inHouseStockList[index].qty)
                                //     .toInt()
                                //     .toString(),
                                textAlign: TextAlign.center,
                                color: Colors.black),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: inHouseStockList[index].warehouseList[0] ==
                                    requestWarehouseID
                                ? AppColor.orangeColor
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.dropshadowColor,
                                  blurRadius: 3,
                                  spreadRadius: 3),
                            ]),
                        alignment: Alignment.center,
                        child: textWidget(
                            inHouseStockList[index].warehouseList[1],
                            // double.parse(
                            //         inHouseStockList[index].qty)
                            //     .toInt()
                            //     .toString(),
                            textAlign: TextAlign.center,
                            color: inHouseStockList[index].warehouseList[0] ==
                                    requestWarehouseID
                                ? Colors.white
                                : Colors.black),
                      ),
              ),
            ],
          );
        },
        itemCount: inHouseStockList.length,
      ),
    );
  }
}