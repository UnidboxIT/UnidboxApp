import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widgets/text_widget.dart';

Widget jobOrderBusyWidget(String name, String jobType, String address) {
  return Container(
    width: 60.w,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 15,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWidget(
                  name,
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                textWidget(
                  jobType == "delivery" ? "Delivery" : "Servicing",
                  size: 13,
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ],
              ),
              child: SizedBox(
                child: Image.asset(
                  'assets/images/service.png',
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        textWidget(address)
      ],
    ),
  );
}
