import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/controllers/home_controller.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/utils/constant/app_constant.dart';
import 'package:unidbox_app/views/screens/home_screens/my_task_screen.dart';
import '../../../controllers/notification_controller.dart';
import '../../../models/admin.dart';
import '../../../utils/commons/common_method.dart';
import 'ongoing_job_screen.dart';
import 'widgets/home_app_bar_widget.dart';
import 'widgets/important_reminder_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = GetStorage();
  @override
  void initState() {
    super.initState();
    setState(() {
      if (xUserAuthorized()) {
        var userJson = jsonDecode(box.read(AppKeys.userInfo));
        admin = Admin.fromJson(userJson);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(NotificationController());

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
                    offset: Offset(45.w, 2.h),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        height: 20,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          border: const Border(),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(44.1.w, 2.5.h),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        height: 30,
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
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: const [
                    MyTaskScreen(),
                    OngoingJobScreen(),
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
