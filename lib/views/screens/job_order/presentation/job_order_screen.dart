import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../../utils/constant/app_color.dart';

class JobOrderScreen extends StatelessWidget {
  const JobOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
        topColor: AppColor.primary,
        botColor: Colors.white,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: Center(
            child: textWidget("New Feature Coming in Next Version!!"),
          ),
        ));
  }
}
