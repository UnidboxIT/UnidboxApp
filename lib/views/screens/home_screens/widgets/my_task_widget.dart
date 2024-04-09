import 'package:flutter/material.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

class MyTaskWidget extends StatelessWidget {
  const MyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textWidget("My Task"),
      ],
    );
  }
}
