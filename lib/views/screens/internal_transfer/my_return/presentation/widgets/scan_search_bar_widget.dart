import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget scanSearchBarWidget() {
  TextEditingController txtSearchController = TextEditingController();
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Container(
      // height: 10.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        autofocus: false,
        textAlign: TextAlign.left,
        controller: txtSearchController,
        cursorColor: Colors.grey,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          suffixIcon: IconButton(
            icon: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 18,
            ),
            onPressed: () {},
          ),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            size: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}