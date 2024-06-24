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
  final int totalInternalTransferLength;
  const MyTaskScreen({
    super.key,
    required this.myTaskList,
    required this.myTaskDetailMap,
    required this.totalInternalTransferLength,
  });

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
            size: 20,
          ),
          const SizedBox(height: 0),
          SizedBox(
            height: 29.h,
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
                              myTaskDetailMap: myTaskDetailMap),
                        ),
                      );
                    },
                    child: eachMyTaskWidget(
                      myTaskList[index],
                      totalInternalTransferLength,
                    ));
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
