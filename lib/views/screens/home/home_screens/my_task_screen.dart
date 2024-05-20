// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../../../controllers/home_controllers/home_controller.dart';
// import '../../../widgets/text_widget.dart';
// import 'my_task_detail_screen.dart';
// import 'widgets/each_my_task_widget.dart';

// class MyTaskScreen extends StatelessWidget {
//   const MyTaskScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.find<HomeController>().getAllMyTask();
//     return Container(
//       padding: const EdgeInsets.only(left: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           textWidget(
//             "My Task",
//             fontWeight: FontWeight.w600,
//             size: 16,
//           ),
//           const SizedBox(height: 0),
//           GetBuilder<HomeController>(builder: (controller) {
//             return SizedBox(
//               height: 27.h,
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
//                 itemBuilder: (context, index) {
//                   if (controller.myTaskList.isEmpty) {
//                     return shimmerMyTaskWidget();
//                   }
//                   return GestureDetector(
//                       onTap: () {
//                         Get.to(() => MyTaskDetailScreen(
//                               parentID:
//                                   controller.myTaskList[index].id.toString(),
//                               name:
//                                   controller.myTaskList[index].name.toString(),
//                             ));
//                       },
//                       child: eachMyTaskWidget(controller.myTaskList[index]));
//                 },
//                 itemCount: controller.myTaskList.length,
//                 separatorBuilder: (context, index) {
//                   return const SizedBox(width: 20);
//                 },
//               ),
//             );
//           })
//         ],
//       ),
//     );
//   }
// }
