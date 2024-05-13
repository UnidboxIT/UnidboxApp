import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../profile_screens/widgets/profile_text_field_widget.dart';

Widget eachTextFieldWidget(
    String name, TextEditingController controller, String hintText,
    {double horizontal = 20}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(
          name,
          fontWeight: FontWeight.bold,
          color: AppColor.pinkColor,
        ),
        const SizedBox(height: 5),
        profileTextFieldWidget(controller, hintText)
      ],
    ),
  );
}

// Widget eachAddProductVarietyFieldWidget(
//     TextEditingController controller, String hintText,
//     {bool isNumber = false}) {
//   return Container(
//     height: 40,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(8),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.3),
//           spreadRadius: 3,
//           blurRadius: 7,
//           offset: const Offset(0, 3),
//         ),
//       ],
//     ),
//     child: TextField(
//       textAlign: TextAlign.left,
//       controller: controller,
//       cursorColor: Colors.grey,
//       style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//       keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(
//             fontSize: 13,
//             color: AppColor.fontColor.withOpacity(0.6),
//             fontWeight: FontWeight.w500),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//         suffix: const SizedBox(width: 25),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     ),
//   );
// }

Widget eachProductVarietyTextFieldWidget(String name, String text,
    {double horizontal = 20}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      textWidget(
        name,
        fontWeight: FontWeight.bold,
        color: AppColor.pinkColor,
      ),
      const SizedBox(height: 5),
      Container(
        height: 40,
        width: 40.w,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.dropshadowColor,
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: textWidget(
          text,
          fontWeight: FontWeight.bold,
          size: 14,
        ),
      ),
    ],
  );
}
