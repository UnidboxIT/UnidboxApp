import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../utils/constant/app_color.dart';

class SearchOrderReceiving extends StatefulWidget {
  const SearchOrderReceiving({super.key});

  @override
  State<SearchOrderReceiving> createState() => _SearchOrderReceivingState();
}

class _SearchOrderReceivingState extends State<SearchOrderReceiving> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
      child: Container(
        width: 100.w,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: AppColor.dropshadowColor,
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(3, 0),
              ),
            ]),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: "Search ...",
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
              fontSize: 14,
            ),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                color: Colors.black,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}