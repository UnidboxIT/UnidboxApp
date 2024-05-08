import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

Widget eachInventoryTrackerWidget(
    String image, String name, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColor.dropshadowColor,
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ListTile(
              onTap: onPressed,
              leading: Image.network(
                image == "null"
                    ? "https://rukminim2.flixcart.com/image/850/1000/xif0q/fan/x/q/u/brio-turbo-high-speed-decorative-50-1-ceiling-fan-600-candes-original-imaghrauuhzsujcy.jpeg?q=90&crop=false"
                    : image,
                width: 45,
                height: 50,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: textWidget(name.toUpperCase(),
                    fontWeight: FontWeight.bold,
                    size: 16,
                    textAlign: TextAlign.left),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            ))),
  );
}
