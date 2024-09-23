import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/commons/super_print.dart';
import '../../../../../../utils/constant/app_color.dart';
import '../../repository/provider/my_request_provider.dart';

class SearchPendingRequestWidget extends ConsumerStatefulWidget {
  final TextEditingController txtController;
  const SearchPendingRequestWidget({super.key, required this.txtController});

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
          onChanged: (query) {
            superPrint(query);
            setState(() {
              widget.txtController.text = query;
              ref
                  .read(myRequestStateNotifierProvider.notifier)
                  .searchMyRequestData(query);
            });
          },
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
