import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/home/presentation/my_task/my_task_detail_screen.dart';
import '../../../../widgets/text_widget.dart';
import '../../domain/my_task.dart';
import '../widgets/each_my_task_widget.dart';

class MyTaskScreen extends ConsumerWidget {
  final List<MyTask> myTaskList;
  final Map<int, List<MyTask>> myTaskDetailMap;
  const MyTaskScreen(
      {super.key, required this.myTaskList, required this.myTaskDetailMap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                                  myTaskDetailMap[myTaskList[index].id] ?? []),
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
