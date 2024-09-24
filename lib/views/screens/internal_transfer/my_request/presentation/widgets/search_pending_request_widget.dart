import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../utils/constant/app_color.dart';

class SearchPendingRequestWidget extends ConsumerStatefulWidget {
  final TextEditingController txtController;
  final Function(String)? onChanged;
  const SearchPendingRequestWidget(
      {super.key, required this.txtController, required this.onChanged});

  @override
  ConsumerState<SearchPendingRequestWidget> createState() =>
      _SearchOrderReceivingState();
}

class _SearchOrderReceivingState
    extends ConsumerState<SearchPendingRequestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.dropshadowColor,
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(2, -1),
            ),
          ],
        ),
        child: TextField(
          controller: widget.txtController,
          onChanged: widget.onChanged,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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

// class SearchRejectRequestWidget extends StatefulWidget {
//   const SearchRejectRequestWidget({super.key});

//   @override
//   State<SearchRejectRequestWidget> createState() =>
//       _SearchRejectRequestWidget();
// }

// class _SearchRejectRequestWidget extends State<SearchRejectRequestWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 0),
//       child: Container(
//         width: 100.w,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: AppColor.dropshadowColor,
//               spreadRadius: 2,
//               blurRadius: 2,
//               offset: const Offset(2, -1),
//             ),
//           ],
//         ),
//         child: TextField(
//           style: const TextStyle(
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//             fontSize: 14,
//           ),
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             hintText: "Search ...",
//             hintStyle: TextStyle(
//               color: Colors.black.withOpacity(0.4),
//               fontSize: 14,
//             ),
//             prefixIcon: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.search,
//                 color: Colors.black,
//               ),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide.none,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
