import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/notification_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachListTileWidget(
    IconData iconData, String name, Color color, VoidCallback onPressed) {
  return GetBuilder<NotificationController>(builder: (controller) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(iconData, color: color, size: 23),
      contentPadding: EdgeInsets.zero,
      title: textWidget(
        name,
        color: AppColor.fontColor,
        fontWeight: FontWeight.w600,
        size: 14,
      ),
      trailing: name == "Notifications"
          ? Transform.scale(
              scale: 0.5,
              alignment: Alignment.centerRight,
              child: Switch(
                value: controller.isSwitched,
                onChanged: (value) {
                  controller.toggleSwitch(value);
                },
                inactiveThumbColor: AppColor.fontColor,
                inactiveTrackColor: Colors.white,
              ),
            )
          : const SizedBox(
              child: Icon(Icons.arrow_forward_ios_outlined, size: 20),
            ),
    );
  });
}
