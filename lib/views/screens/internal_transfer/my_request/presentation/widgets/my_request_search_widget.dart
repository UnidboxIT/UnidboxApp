import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';

import '../../domain/my_request.dart';

class MyRequestSearchWidget extends StatefulWidget {
  final List<MyRequest> myRequestList;
  const MyRequestSearchWidget({super.key, required this.myRequestList});

  @override
  State<MyRequestSearchWidget> createState() => _SearchOrderReceivingState();
}

class _SearchOrderReceivingState extends State<MyRequestSearchWidget> {
  TextEditingController txtSearchMyRequest = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        height: 40,
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
          controller: txtSearchMyRequest,
          cursorColor: Colors.grey,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          textInputAction: TextInputAction.done,
          onChanged: (query) async {
            setState(() {
              List<MyRequest> searchRequest =
                  widget.myRequestList.where((request) {
                return request.name
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    request.userId[1].contains(query);
              }).toList();
              superPrint(searchRequest);
            });
          },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
}
