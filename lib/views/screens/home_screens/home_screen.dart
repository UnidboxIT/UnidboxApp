import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

import 'widgets/home_app_bar_widget.dart';
import 'widgets/important_reminder_widget.dart';
import 'widgets/my_task_widget.dart';
import 'widgets/ongoing_job_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: const Color(0xffF6F6F6),
      botColor: Colors.white,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBarWidget(),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const ImportantReminderWidget(),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    MyTaskWidget(),
                    OngoingJobWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
