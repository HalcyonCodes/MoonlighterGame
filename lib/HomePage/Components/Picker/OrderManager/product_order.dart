import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import './item.dart';

class ProductOrder extends StatefulWidget {
  final String? orderId;
  final String? orderTime;

  final String? orderStatus;
  final String? sourceId;
  final String? sourceName;
  final String? targetId;
  final String? targetName;

  const ProductOrder(
      {super.key,
      required this.orderId,
      required this.orderTime,
      required this.orderStatus,
      required this.sourceId,
      required this.sourceName,
      required this.targetId,
      required this.targetName});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  String? orderId;
  String? orderTime;
  String? orderStatus;
  String? sourceId;
  String? sourceName;
  String? targetId;
  String? targetName;

  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    orderId = widget.orderId;
    orderTime = widget.orderTime;
    orderStatus = widget.orderStatus;
    sourceId = widget.sourceId;
    sourceName = widget.sourceName;
    targetId = widget.targetId;
    targetName = widget.targetName;
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(6, (index) {
      return Item(itemName: '纤维手套', itemType: '1', itemCount: '999', isStart: index == 0,);
    });
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  orderId!,
                  style: KFont.cardProfileStyle,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '创建时间： ${orderTime!}',
                  style: KFont.cardProfileStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 24) / 24 * 8 -
                  24 -
                  24 -
                  24,
              height: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        KString.productOrder,
                        style: KFont.cardTitleStyle,
                      )),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(orderStatus!, style: KFont.cardPrimaryStyle),
                        const Expanded(child: SizedBox()),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset('Svg/up_card.svg'),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset('Svg/down_card.svg'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 24) / 24 * 8 -
                  24 -
                  24 -
                  24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Text(
                          KString.sourceId,
                          style: KFont.cardProfileStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          sourceId!,
                          style: KFont.cardTitleStyle,
                        ),
                      ])),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Text(
                          KString.sourceName,
                          style: KFont.cardProfileStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          sourceName!,
                          style: KFont.cardTitleStyle,
                        ),
                      ])),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 24) / 24 * 8 -
                  24 -
                  24 -
                  24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 1,
                      child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Text(
                          KString.targetId,
                          style: KFont.cardProfileStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          targetId!,
                          style: KFont.cardTitleStyle,
                        ),
                      ])),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        Text(
                          KString.targetName,
                          style: KFont.cardProfileStyle,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          targetName!,
                          style: KFont.cardTitleStyle,
                        ),
                      ])),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                      height: 17,
                      child: Text(
                        KString.itemName,
                        style: KFont.cardProfileStyle,
                      )),
                ),
                // const Expanded(child: SizedBox()),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                    width: 21,
                    height: 22,
                    child: Text(
                      KString.itemStyle,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                    width: 35,
                    child: Text(
                      KString.itemCount,
                      style: KFont.cardProfileStyle,
                    )),
              ],
            ),
            const SizedBox(height: 12,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items!,
            )
          ],
        ),
      ),
    );
  }
}
