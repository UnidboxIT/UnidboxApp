import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget loginImageWidget() {
  return Container(
    width: 70.w,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: Image.asset('assets/images/logo.jpeg'),
  );
}
