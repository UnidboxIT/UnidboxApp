import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/home/presentation/my_task/my_task_detail_screen.dart';
import 'package:unidbox_app/models/home/my_task.dart';
import '../../../views/widgets/text_widget.dart';
import '../../repository/provider/home_provider.dart';
import '../../repository/state/home_state.dart';
import '../widgets/each_my_task_widget.dart';

class MyTaskScreen extends ConsumerStatefulWidget {
  const MyTaskScreen({super.key});

  @override
  ConsumerState<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends ConsumerState<MyTaskScreen> {
  List<MyTask> myTaskList = [];
  Map<int, List<MyTask>> myTaskDetailMap = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(homeStateNotifierProvider.notifier).getAllMyTask();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(homeStateNotifierProvider, (prev, next) {
      if (next is Loading) {
        myTaskList = [];
      }
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
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget(
            "My Task",
            fontWeight: FontWeight.w600,
            size: 16,
          ),
          const SizedBox(height: 0),
          SizedBox(
            height: 27.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyTaskDetailScreen(
                            parentID: myTaskList[index].id.toString(),
                            name: myTaskList[index].name.toString(),
                            myTaskDetail:
                                myTaskDetailMap[myTaskList[index].id] ?? [],
                          ),
                        ),
                      );
                    },
                    child: eachMyTaskWidget(myTaskList[index]));
              },
              itemCount: myTaskList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
            ),
          ),
        ],
      ),
    );
  }
}
