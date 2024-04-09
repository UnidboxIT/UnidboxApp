import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import 'widgets/home_app_bar_widget.dart';
import 'widgets/important_reminder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              const HomeAppBarWidget(),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const ImportantReminderWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
