import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

class PurchaseOrderPdfViewScreen extends StatefulWidget {
  final Uint8List imageUrl;
  const PurchaseOrderPdfViewScreen({super.key, required this.imageUrl});

  @override
  State<PurchaseOrderPdfViewScreen> createState() =>
      _PurchaseOrderPdfViewScreenState();
}

class _PurchaseOrderPdfViewScreenState
    extends State<PurchaseOrderPdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
        child: Scaffold(
      body: Container(
        child: Image.memory(widget.imageUrl),
      ),
    ));
  }
}
