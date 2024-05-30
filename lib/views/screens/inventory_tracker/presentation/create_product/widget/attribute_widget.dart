import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:unidbox_app/utils/constant/app_color.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/provider/create_product_provider.dart';
import 'package:unidbox_app/views/screens/inventory_tracker/repository/state/create_product_state/attribute_state.dart';
import 'package:unidbox_app/views/widgets/text_widget.dart';
import '../../../domain/attribute.dart';
import 'show_attribute_dropdown.dart';

class AttributeWidget extends ConsumerStatefulWidget {
  const AttributeWidget({super.key});

  @override
  ConsumerState<AttributeWidget> createState() => _AttributeWidgetState();
}

class _AttributeWidgetState extends ConsumerState<AttributeWidget> {
  List<Attribute> attributeList = [];
  List<Attribute> attributeIdList = [];
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 0),
          child: Row(
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
              ),
            ],
          ),
        ),
        attributeAllWidget(),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 20,
            ),
            itemCount: attributeIdList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 42.w,
                child: ShowAttributeDropdown(
                  id: attributeIdList[index].id.toString(),
                  name: attributeIdList[index].name,
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget attributeAllWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5),
          itemCount: attributeList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedAttribute = Attribute();
                if (!attributeIdList.contains(attributeList[index])) {
                  setState(() {
                    attributeIdList.add(attributeList[index]);
                    ref
                        .read(attributeStateNotifierProvider.notifier)
                        .getAttributeByID(attributeList[index].id.toString());
                  });
                } else {
                  setState(() {
                    attributeIdList.remove(attributeList[index]);
                  });
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    attributeIdList.contains(attributeList[index])
                        ? Icon(
                            Icons.check_box_rounded,
                            color: AppColor.primary,
                          )
                        : Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey.shade400,
                          ),
                    const SizedBox(width: 8),
                    textWidget(
                      attributeList[index].name,
                      size: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
