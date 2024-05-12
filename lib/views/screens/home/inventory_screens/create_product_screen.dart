import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';

import 'create_product_widget/camera_widget.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      botColor: Colors.white,
      child: Scaffold(
          body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: createProductWidget(),
      )),
    );
  }

  Widget createProductWidget() {
    return Stack(
      children: [
        globalAppBarWidget(
          "Create Product",
          () {},
        ),
        Transform.translate(
          offset: Offset(0, 13.h),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: productBodyWidget(),
          ),
        ),
      ],
    );
  }

  Widget productBodyWidget() {
    return ListView(
      children: [
        cameraWidget(),
      ],
    );
  }
}
