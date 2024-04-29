import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

globalBottomSheet(Widget dynamicWidget) {
  return showModalBottomSheet(
    backgroundColor: Colors.black.withOpacity(0.1),
    barrierColor: Colors.black.withOpacity(0.3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: Get.context!,
    elevation: 0,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
          child: dynamicWidget,
        ),
      );
    },
  );
}
