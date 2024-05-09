import 'package:flutter/material.dart';
import '../../../../utils/commons/super_scaffold.dart';
import '../../../../utils/constant/app_color.dart';

class InternalTransferScreen extends StatelessWidget {
  const InternalTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: AppColor.bgColor,
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: Container(),
      ),
    );
  }
}
