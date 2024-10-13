import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:unidbox_app/utils/commons/super_scaffold.dart';

class PurchaseOrderPdfViewScreen extends StatefulWidget {
  final String filePath;
  const PurchaseOrderPdfViewScreen({super.key, required this.filePath});

  @override
  State<PurchaseOrderPdfViewScreen> createState() => _PurchaseOrderPdfViewScreenState();
}

class _PurchaseOrderPdfViewScreenState extends State<PurchaseOrderPdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperScaffold(child: Scaffold(body: Container(child: PDFView(filePath: widget.filePath,),),));
  }
}
