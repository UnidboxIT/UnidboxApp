import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import 'widgets/search_widget.dart';

class MessageBodyScreen extends StatelessWidget {
  const MessageBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        searchWidget(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              color: AppColor.orangeColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: textWidget("Customer",
                              size: 13, color: Colors.white),
                        ),
                        const SizedBox(width: 15),
                        textWidget("2 mins",
                            color: AppColor.fontColor, size: 14)
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: 100.w,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 35,
                            backgroundImage: CachedNetworkImageProvider(
                              "https://images.pexels.com/photos/834872/pexels-photo-834872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textWidget(
                                "Mark",
                                size: 19,
                                fontWeight: FontWeight.bold,
                                color: AppColor.fontColor,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 62.w,
                                    child: textWidget(
                                      "How much Ah?",
                                      size: 14,
                                      color: AppColor.fontColor,
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColor.pinkColor,
                                    child: textWidget("3", color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColor.primary,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: 10,
            ),
          ),
        )
      ],
    );
  }
}
