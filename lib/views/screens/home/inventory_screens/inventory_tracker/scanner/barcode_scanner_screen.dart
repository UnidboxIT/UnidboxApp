import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';

class BarCodeScannerScreen extends StatefulWidget {
  const BarCodeScannerScreen({super.key});

  @override
  _BarcodeScannerWithOverlayState createState() =>
      _BarcodeScannerWithOverlayState();
}

class _BarcodeScannerWithOverlayState extends State<BarCodeScannerScreen>
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
                "Inventory Tracker",
                () {
                  Get.back();
                },
              ),
              Transform.translate(
                offset: Offset(0, 14.h),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: barcodeScannerWidget(scanWindow)),
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
      child: GetBuilder<ProductController>(builder: (controller) {
        return Stack(
          alignment: Alignment.center,
          children: [
            MobileScanner(
              fit: BoxFit.contain,
              controller: mobileScanner,
              scanWindow: scanWindow,
              onDetect: (capture) {
                mobileScanner.start();
                for (var barcode in capture.barcodes) {
                  superPrint(barcode.rawValue);
                  Get.back();
                  controller.scanProductByBarCode(barcode.rawValue.toString());
                }
                mobileScanner.stop();
              },
            ),
            scannerOverlayWidget(),
            scannerBorderWidget(),
          ],
        );
      }),
    );
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
            Transform.translate(
                offset: Offset(0, 35.h),
                child: const Text(
                  'Scan product code to find product',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}