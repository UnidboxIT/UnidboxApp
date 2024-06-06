import 'package:flutter/cupertino.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../utils/constant/app_color.dart';

Widget loadMoreWidget() {
  return SizedBox(
    height: 30,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: AppColor.bgColor, borderRadius: BorderRadius.circular(4)),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWidget("Loadmore ...",
              color: AppColor.pinkColor, fontWeight: FontWeight.bold, size: 15),
          CupertinoActivityIndicator(color: AppColor.pinkColor),
        ],
      ),
    ),
  );
}
