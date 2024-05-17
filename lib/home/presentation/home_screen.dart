import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/widgets/app_bar/global_app_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SuperScaffold(
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: globalAppBarWidget("Home", () {}),
        ),
      ),
    );
  }
}
