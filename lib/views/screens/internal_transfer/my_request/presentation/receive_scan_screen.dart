import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/views/screens/internal_transfer/my_request/repository/provider/my_request_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/product_provider.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';

class ReceiveScanScreen extends ConsumerStatefulWidget {
  final int productID;
  const ReceiveScanScreen({super.key, required this.productID});

  @override
  _BarcodeScannerWithOverlayState createState() =>
      _BarcodeScannerWithOverlayState();
}

class _BarcodeScannerWithOverlayState extends ConsumerState<ReceiveScanScreen>
    with SingleTickerProviderStateMixin {
  late MobileScannerController mobileScanner;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    mobileScanner = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
    );
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    mobileScanner.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 68.w,
      height: 50.h,
    );

    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              globalAppBarWidget(
                "Inventory Transfer",
                () {
                  Navigator.of(context).pop();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: barcodeScannerWidget(scanWindow)),
              ),
              Positioned(
                bottom: 6.h,
                left: 8.w,
                right: 8.w,
                child: GestureDetector(
                  onTap: () {
                    superPrint("hay hay");
                    // ref
                    //     .read(myRequestStateNotifierProvider.notifier)
                    //     .doneMyRequest(widget.productID);
                  },
                  child: Container(
                    height: 40,
                    width: 60.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Items Received",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget barcodeScannerWidget(scanWindow) {
    return SizedBox(
        height: 60.h,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            MobileScanner(
              fit: BoxFit.contain,
              controller: mobileScanner,
              scanWindow: scanWindow,
              onDetect: (capture) {
                mobileScanner.start();
                ref
                    .read(scanProductStateNotifierProvier.notifier)
                    .clearScanProduct();
                for (var barcode in capture.barcodes) {
                  ref
                      .read(scanProductStateNotifierProvier.notifier)
                      .scanProductByBarCode(
                          barcode.rawValue.toString(), context, 0);
                }
                mobileScanner.stop();
              },
            ),
            scannerOverlayWidget(),
            scannerBorderWidget(),
          ],
        ));
  }

  Widget scannerOverlayWidget() {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: ClipRRect(
        child: ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcOut,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      backgroundBlendMode: BlendMode.dstOut)),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
                child: const AspectRatio(aspectRatio: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget scannerBorderWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    top: animationController.value *
                        MediaQuery.of(context).size.width *
                        0.65,
                  ),
                  child: Container(
                    width: double.maxFinite,
                    height: 1.5,
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(color: AppColor.primary),
                  ),
                );
              },
            ),
            Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset('assets/icons/scanner_border.svg',
                    color: AppColor.pinkColor)),
            Positioned(
                top: 0,
                right: 0,
                child: RotatedBox(
                    quarterTurns: 1,
                    child: SvgPicture.asset('assets/icons/scanner_border.svg',
                        color: AppColor.pinkColor))),
            Positioned(
                bottom: 0,
                left: 0,
                child: RotatedBox(
                    quarterTurns: 3,
                    child: SvgPicture.asset('assets/icons/scanner_border.svg',
                        color: AppColor.pinkColor))),
            Positioned(
                bottom: 0,
                right: 0,
                child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset('assets/icons/scanner_border.svg',
                        color: AppColor.pinkColor))),
          ],
        ),
      ),
    );
  }
}
