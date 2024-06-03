import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

class MyRequestsDetailScreen extends StatefulWidget {
  const MyRequestsDetailScreen({super.key});

  @override
  State<MyRequestsDetailScreen> createState() => _MyRequestsDetailScreenState();
}

class _MyRequestsDetailScreenState extends State<MyRequestsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        body: myrequestDetailWidget(),
      ),
    );
  }

  Widget myrequestDetailWidget() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return null;
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: 10);
  }
}
