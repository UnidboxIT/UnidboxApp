import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class ProductWidget extends StatelessWidget {
  final String name;
  const ProductWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        color: AppColor.bgColor,
        child: textWidget("No Data"),
      ),
    );
  }
}
