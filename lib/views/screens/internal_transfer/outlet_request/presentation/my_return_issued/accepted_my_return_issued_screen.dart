import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:slide_action/slide_action.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import '../../../../../../utils/commons/common_method.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../../../../user_warehouse/domain/user_warehouse.dart';
import '../../../../../widgets/app_bar/global_app_bar.dart';
import '../../../../../widgets/text_widget.dart';
import '../../../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import '../../../my_request/domain/my_request.dart';
import '../../../my_return/presentation/widgets/each_my_return_product_widget.dart';
import '../../../my_return/repository/provider/my_return_provider.dart';
import '../../../my_return/repository/state/my_return_state.dart';
import '../../repository/provider/other_request_provider.dart';
import '../widgets/search_other_request_widget.dart';

class AcceptedMyReturnIssuedScreen extends ConsumerStatefulWidget {
  final int warehouseID;
  final String warehouseName;
  const AcceptedMyReturnIssuedScreen(
      {super.key, required this.warehouseID, required this.warehouseName});

  @override
  ConsumerState<AcceptedMyReturnIssuedScreen> createState() =>
      _AcceptedReturnScreenState();
}

class _AcceptedReturnScreenState
    extends ConsumerState<AcceptedMyReturnIssuedScreen> {
  List<Map<int, dynamic>> requestedMapList = [];
  Map<int, dynamic> requestedMap = {};
  bool requestLoading = false;
  List<MyRequest> myReturnList = [];
  List<ProductLineId> acceptedReturnList = [];
  int acceptProductID = -1;
  bool acceptLoading = false;
  UserWarehouse userWarehouse = UserWarehouse();
  bool isWarehouseLoading = false;
  List<String> visibleCode = [];
  bool isSwipeLoading = false;
  List<int> idList = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(myReturnStateNotifierProvider.notifier).getAllMyReturn();
    });
  }

  loadSetVisiblity(String code) {
    setState(() {
      visibleCode.add(code);
    });
  }

  removeVisiblity(String code) {
    setState(() {
      visibleCode.remove(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(myReturnStateNotifierProvider, (pre, next) {
      if (next is MyReturnLoading) {
        setState(() {
          requestLoading = true;
          myReturnList = [];
          acceptedReturnList.clear();
        });
      }
      if (next is MyReturnDataList) {
        setState(() {
          myReturnList = next.myReturnDataList;
          requestedMap.clear();
          requestedMapList.clear();
          for (var data in myReturnList) {
            for (var element in data.productLineList) {
              if (element.status == "return_accepted" && element.isReturn) {
                int warehouseId = element.requestWarehouse[0];
                String warehouseName = element.requestWarehouse[1];
                String productLineKey = data.name;
                if (!requestedMap.containsKey(warehouseId)) {
                  requestedMap[warehouseId] = {
                    "warehouse_name": warehouseName,
                    "name": data.userId[1],
                    "date": data.createDate,
                    "product_line": {},
                  };
                }
                if (!requestedMap[warehouseId]['product_line']
                    .containsKey(productLineKey)) {
                  requestedMap[warehouseId]['product_line']
                      [productLineKey] = [];
                }
                requestedMap[warehouseId]['product_line'][productLineKey]
                    .add(element);
              }
            }
          }
          acceptLoading = false;
          requestLoading = false;
          if (requestedMap.isNotEmpty) {
            requestedMapList
                .add({widget.warehouseID: requestedMap[widget.warehouseID]});
            //requestedMapList.add(requestedMap);
          }
        });
      }
    });
    superPrint(requestedMapList);

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
                "Accepted Return",
                () {
                  ref.read(bottomBarVisibilityProvider.notifier).state = true;
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              Positioned(
                right: 5.w,
                top: 6.5.h,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: const Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: myReturnWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myReturnWidget() {
    superPrint(acceptedReturnList);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 20.w,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.orangeColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.dropshadowColor,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(-2, 2),
                          )
                        ]),
                    child:
                        textWidget(widget.warehouseName, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: requestedMap[widget.warehouseID] != null ||
                          widget.warehouseID == -1
                      ? myReturnDataWidget(requestedMapList)
                      : Center(
                          child: textWidget("No Data !"),
                        ),
                ),
                Container(
                  height: 12.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  child: SlideAction(
                    thumbWidth: 100,
                    rightToLeft: isSwipeLoading,
                    trackBuilder: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              left: state.isPerformingAction || isSwipeLoading
                                  ? 0
                                  : 20.w,
                              right: state.isPerformingAction || isSwipeLoading
                                  ? 20.w
                                  : 0),
                          child: Text(
                            // Show loading if async operation is being performed
                            isSwipeLoading
                                ? "Issued"
                                : state.isPerformingAction
                                    ? "Loading..."
                                    : ">>  Slide to Issue",
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      );
                    },
                    thumbBuilder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          // Show loading indicator if async operation is being performed
                          child: state.isPerformingAction
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : const Icon(
                                  CupertinoIcons.car,
                                  color: Colors.white,
                                ),
                        ),
                      );
                    },
                    action: () async {
                      //Async operation
                      if (!isSwipeLoading) {
                        await Future.delayed(
                          const Duration(milliseconds: 10),
                          () {
                            setState(() {
                              isSwipeLoading = true;
                            });
                            superPrint(idList);
                            setState(() {
                              for (var warehouseProduct in requestedMapList) {
                                warehouseProduct.forEach((key, value) {
                                  idList.add(value['id']);
                                });
                              }
                              Future.delayed(const Duration(milliseconds: 100));
                              if (idList.isNotEmpty) {
                                ref
                                    .read(otherRequestStateNotifierProvider
                                        .notifier)
                                    .deliveryReturnIssued(idList, context)
                                    .then((_) {
                                  isSwipeLoading = false;
                                });
                              } else {
                                isSwipeLoading = false;
                                CommonMethods.customizedAlertDialog(
                                    "Please packed all your requested product",
                                    context);
                              }
                            });
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget myReturnDataWidget(
    List<Map<int, dynamic>> requestedMapList,
  ) {
    return requestedMapList.isEmpty
        ? Center(
            child: textWidget("No Data !"),
          )
        : ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20),
            physics: const ClampingScrollPhysics(),
            itemCount: requestedMapList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 0);
            },
            itemBuilder: (context, index) {
              Map<int, dynamic> warehouseMap = requestedMapList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: warehouseMap.entries.map((entry) {
                  // int warehouseId = entry.key;
                  Map<dynamic, dynamic> warehouseData = entry.value;
                  Map<dynamic, dynamic> productLineMap =
                      warehouseData['product_line'];
                  return productLineMap.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          width: 100.w,
                          height: 50.h,
                          child: textWidget("No Data !"),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: productLineMap.keys.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 0);
                          },
                          itemBuilder: (context, productIndex) {
                            String productLineKey =
                                productLineMap.keys.elementAt(productIndex);
                            superPrint(productLineKey);
                            superPrint(productLineMap[productLineKey]);
                            List<dynamic> productList =
                                productLineMap[productLineKey];
                            superPrint(productList);
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.dropshadowColor
                                          .withOpacity(0.02),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (visibleCode
                                                .contains(productLineKey)) {
                                              removeVisiblity(productLineKey);
                                            } else {
                                              loadSetVisiblity(productLineKey);
                                            }
                                          },
                                          child: Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColor.bottomSheetBgColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.03),
                                                      offset:
                                                          const Offset(0, 3),
                                                      blurRadius: 3)
                                                ]),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                textWidget(
                                                  productLineKey,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black,
                                                  size: 20,
                                                ),
                                                textWidget(
                                                    DateFormat('dd MMM yyyy')
                                                        .format(
                                                      DateTime.parse(
                                                          warehouseData[
                                                              'date']),
                                                    ),
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    size: 17)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: visibleCode
                                              .contains(productLineKey),
                                          child: const SizedBox(height: 13),
                                        ),
                                        Visibility(
                                          visible: visibleCode
                                              .contains(productLineKey),
                                          child: eachMyReturnProductLineWidget(
                                            productLineKey,
                                            warehouseData['warehouse_name'],
                                            warehouseData['date'],
                                            warehouseData['name'],
                                            productList,
                                            acceptProductID: acceptProductID,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20)
                              ],
                            );
                          },
                        );
                }).toList(),
              );
            },
          );
  }
}