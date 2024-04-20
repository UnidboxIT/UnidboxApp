import 'package:flutter/cupertino.dart';

import 'widgets/search_widget.dart';

class MessageBodyScreen extends StatelessWidget {
  const MessageBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchWidget(),
      ],
    );
  }
}
