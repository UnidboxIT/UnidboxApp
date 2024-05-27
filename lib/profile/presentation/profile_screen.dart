import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/profile/presentation/widgets/barcode_widget.dart';
import 'package:unidbox_app/profile/presentation/widgets/profile_body_widget.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              barcodeWidget(context),
              Transform.translate(
                offset: Offset(0, 7.h),
                child: const ProfileBodyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
