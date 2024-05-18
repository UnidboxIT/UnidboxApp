import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:unidbox_app/home/repository/home_state_notifier.dart';
import 'package:unidbox_app/home/repository/time_state_notifier.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../models/noti.dart';
import '../../utils/commons/super_scaffold.dart';
import 'widgets/important_reminder_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Noti> notiList = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(timeStateNotifierProvider.notifier).calculateTime();
      notiList =
          await ref.read(homeStateNotifierProvider.notifier).notiReminder();
      superPrint(notiList);
    });
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
              homeAppBarWidget(ref),
              ImportantReminderWidget(notiList: notiList),
              // Expanded(
              //   child: ListView(
              //     shrinkWrap: true,
              //     children: const [
              //       MyTaskScreen(),
              //       OngoingJobScreen(),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
