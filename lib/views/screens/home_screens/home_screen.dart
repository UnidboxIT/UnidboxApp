import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

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
              Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Transform.translate(
                      offset: Offset(44.w, 2.h),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 20,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            border: const Border(),
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(44.w, 2.h),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Container(
                          height: 20,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: Color(0xffF6F6F6),
                            border: Border(),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 0),
                      child: const ImportantReminderWidget(),
                    ),
                  ]),
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
