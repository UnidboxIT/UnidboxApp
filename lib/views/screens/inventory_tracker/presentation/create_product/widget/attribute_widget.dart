import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/create_product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/attribute_state.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';

import '../../../domain/attribute.dart';

class AttributeWidget extends ConsumerStatefulWidget {
  const AttributeWidget({super.key});

  @override
  ConsumerState<AttributeWidget> createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends ConsumerState<AttributeWidget> {
  List<Attribute> attributeList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      ref.read(attributeStateNotifierProvider.notifier).getAttribute();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(attributeStateNotifierProvider, (pre, next) {
      if (next is Loading) {
        attributeList = [];
      }
      if (next is AttributeList) {
        setState(() {
          attributeList = next.attributeList;
        });
      }
    });
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textWidget(
                "Attribute",
                color: AppColor.pinkColor,
                fontWeight: FontWeight.bold,
                size: 14,
              ),
              Container(
                width: 40.w,
                height: 40,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                color: Colors.transparent,
                child: const Icon(
                  CupertinoIcons.eye,
                  size: 20,
                ),
              )
            ],
          ),
          Wrap(
            children: attributeList
                .map(
                  (e) => textWidget(e.name),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
