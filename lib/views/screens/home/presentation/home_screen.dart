import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/home/domain/my_task.dart';
import 'package:unidbox_app/views/screens/home/presentation/my_task/my_task_screen.dart';
import 'package:unidbox_app/views/screens/home/presentation/ongoing_job/ongoing_job_screen.dart';
import 'package:unidbox_app/views/screens/home/presentation/widgets/home_app_bar_widget.dart';
import 'package:unidbox_app/views/screens/home/repository/state/home_state.dart';
import '../../../../utils/commons/super_scaffold.dart';
import '../domain/noti.dart';
import '../repository/provider/home_provider.dart';
import 'widgets/important_reminder_widget.dart';

List<MyTask> myTaskList = [];
Map<int, List<MyTask>> myTaskDetailMap = {};

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Noti> notiList = [];
  bool isNotiLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(homeStateNotifierProvider.notifier).notiReminder();
      final state = ref.read(homeStateNotifierProvider);
      if (state is Initial) {
        ref.read(homeStateNotifierProvider.notifier).getAllMyTask();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeStateNotifierProvider, (prev, next) {
      if (next is Loading) {
        notiList = [];
        setState(() {
          isNotiLoading = true;
        });
      }
      if (next is NotiList) {
        setState(() {
          notiList = next.notiList;
          isNotiLoading = false;
        });
      }
    });

    ref.listen(homeStateNotifierProvider, (prev, next) {
      if (next is MyTaskList) {
        setState(() {
          myTaskList = next.myTaskList;
        });
      }
      if (next is MyTaskDetailMap) {
        setState(() {
          myTaskDetailMap = next.myTaskDetailMap;
        });
      }
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
              const HomeAppBarWidget(),
              ImportantReminderWidget(
                  notiList: notiList, isLoading: isNotiLoading),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    MyTaskScreen(
                      myTaskList: myTaskList,
                      myTaskDetailMap: myTaskDetailMap,
                    ),
                    const OngoingJobScreen(),
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
