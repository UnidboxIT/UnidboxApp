import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/views/screens/home/repository/state_notifier/time_state_notifier.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../auth/repository/auth_state_notifier.dart';
import '../../../internal_transfer/my_request/presentation/request_history_screen.dart';

class HomeAppBarWidget extends ConsumerWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeStateNotifierProvier);
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(
                time,
                fontWeight: FontWeight.w700,
                size: 14,
                color: Colors.black.withOpacity(0.6),
              ),
              textWidget(
                ref
                    .watch(authStateNotifierControllerProvider.notifier)
                    .getAdminInfo()
                    .name,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                size: 25,
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 10.w,
            height: 50,
            alignment: Alignment.centerRight,
            color: Colors.transparent,
            child: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.redAccent,
            ),
          ),
          Container(
            width: 10.w,
            height: 50,
            alignment: Alignment.centerRight,
            color: Colors.transparent,
            child: const Icon(
              CupertinoIcons.qrcode_viewfinder,
              color: Colors.redAccent,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RequestHistoryScreen()));
            },
            child: Container(
              width: 10.w,
              height: 50,
              color: Colors.transparent,
              alignment: Alignment.centerRight,
              child: const Icon(
                CupertinoIcons.bell,
                color: Colors.redAccent,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
