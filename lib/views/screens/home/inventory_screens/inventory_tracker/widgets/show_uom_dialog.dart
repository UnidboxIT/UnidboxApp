import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unidbox_app/controllers/home_controllers/product_controller.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';

import '../../../../../widgets/text_widget.dart';

showUomDialog() {
  return showModalBottomSheet(
    builder: (context) {
      return GetBuilder<ProductController>(builder: (controller) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 350),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: textWidget("Select Uom",
                      color: AppColor.pinkColor,
                      fontWeight: FontWeight.bold,
                      size: 15),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: controller.uomScrollController,
                    itemCount: controller.uomList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          controller.uomList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: controller.uomList[index].name ==
                                    controller.uomName
                                ? AppColor.pinkColor
                                : Colors.black,
                          ),
                        ),
                        onTap: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          controller
                              .updateUomName(controller.uomList[index].name);
                          Get.back();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                if (controller.xLoading)
                  SizedBox(
                    height: 30,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColor.bgColor,
                          borderRadius: BorderRadius.circular(4)),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textWidget("Loadmore ...",
                              color: AppColor.pinkColor,
                              fontWeight: FontWeight.bold,
                              size: 15),
                          CupertinoActivityIndicator(color: AppColor.pinkColor),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      });
    },
    context: Get.context!,
  );
}
