import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../../utils/constant/app_color.dart';
import '../../system_navigation/show_bottom_navbar_provider/show_bottom_navbar_state_provider.dart';
import 'widgets/each_noti_status_widget.dart';
import 'widgets/outlet_noti_appbar_widget.dart';

class OutletNotificationScreen extends ConsumerStatefulWidget {
  const OutletNotificationScreen({super.key});

  @override
  ConsumerState<OutletNotificationScreen> createState() =>
      _OutletNotificationScreenState();
}

class _OutletNotificationScreenState
    extends ConsumerState<OutletNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      topColor: AppColor.primary,
      child: Scaffold(
        backgroundColor: const Color(0xffF6F6F6),
        body: PopScope(
          onPopInvoked: (_) =>
              ref.read(bottomBarVisibilityProvider.notifier).state = true,
          child: Column(
            children: [
              outletNotiAppbarWidget(
                "Notifications",
                () {
                  ref.read(bottomBarVisibilityProvider.notifier).state = true;
                  Navigator.of(context).pop();
                },
              ),
              Expanded(child: notiDataListWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget notiDataListWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return eachNotiWidget();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: 10);
  }

  Widget eachNotiWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              eachNotiStatusWidget("Urgent", AppColor.primary, Colors.white),
              const SizedBox(width: 10),
              eachNotiStatusWidget("Outlet", Colors.green, Colors.white),
              const Spacer(),
              textWidget(
                dateTimeWidget(DateTime.now()),
                size: 11,
                color: Colors.grey,
              ),
            ],
          ),
          eachNotiTextWidget(
            "Job Request",
            "A urgent job request has been sent !",
            Icons.warning,
          ),
        ],
      ),
    );
  }
}
