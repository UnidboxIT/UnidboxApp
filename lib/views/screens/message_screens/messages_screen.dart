import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../controllers/chat_controllers/message_controller.dart';
import '../../../utils/constant/app_color.dart';
import 'message_body_screen.dart';
import 'widgets/message_app_bar_widget.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MessageController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.primary,
    ));
    return SafeArea(
      child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: GetBuilder<MessageController>(
          builder: (controller) {
            return Stack(
              children: [
                messageAppBarWidget("Message"),
                Transform.translate(
                  offset: Offset(0, 9.h),
                  child: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: AppColor.bgColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: const MessageBodyScreen(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
