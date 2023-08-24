import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import './item_input.dart';

//制作订单
class ProductOrder extends StatefulWidget {
  final String? orderId;
  final String? sourceId;
  final String? targetId;

  const ProductOrder({super.key, this.orderId, this.sourceId, this.targetId});

  @override
  State<ProductOrder> createState() => _ProductOrderState();
}

class _ProductOrderState extends State<ProductOrder> {
  String? orderId;
  String? sourceId;
  String? targetId;

  TextEditingController? orderIdEditCtrl;
  TextEditingController? sourceIdEditCtrl;
  TextEditingController? targetIdEditCtrl;

  List<Widget>? items;

  //test
  List<String> test = ['111', '222', '333', '444', '555', '666', '777', '888'];

  @override
  void initState() {
    super.initState();
    orderId = widget.orderId;
    sourceId = widget.sourceId;
    targetId = widget.targetId;

    orderIdEditCtrl = TextEditingController(text: orderId);
    sourceIdEditCtrl = TextEditingController(text: sourceId);
    targetIdEditCtrl = TextEditingController(text: targetId);

    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(test.length, (index) {
      return ItemInput(
        key: UniqueKey(),
        itemName: test[index],
        itemType: '1',
        itemCount: '999',
        delectOnTap: () {
          delectItem(index);
        },
      );
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
            Text(
              KString.productOrder,
              style: KFont.cardProfileStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 25,
              child: TextField(
                controller: orderIdEditCtrl,
                maxLines: 1,
                style: KFont.cardTitleStyle,
                autofocus: false,
                cursorColor: Colors.black,
                cursorWidth: 2,
                cursorHeight: 25,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(200),
                ],
                maxLength: null,
                onSubmitted: (text) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: ' ',
                  contentPadding: EdgeInsets.zero,
                  hintStyle: KFont.cardTitleStyle,
                  isDense: true,
                  hintMaxLines: 1,
                ),
                strutStyle: const StrutStyle(leading: 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KString.sourceId,
                        style: KFont.cardProfileStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        // width: ((MediaQuery.of(context).size.width - 24) / 24 * 7 - 24) / 2 ,
                        height: 25,
                        child: TextField(
                          controller: sourceIdEditCtrl,
                          maxLines: 1,
                          style: KFont.cardTitleStyle,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorWidth: 2,
                          cursorHeight: 25,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(200),
                          ],
                          maxLength: null,
                          onSubmitted: (text) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' ',
                            contentPadding: EdgeInsets.zero,
                            hintStyle: KFont.cardTitleStyle,
                            isDense: true,
                            hintMaxLines: 1,
                          ),
                          strutStyle: const StrutStyle(leading: 0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        KString.targetId,
                        style: KFont.cardProfileStyle,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 25,
                        // width: ((MediaQuery.of(context).size.width - 24) / 24 * 7 - 24) / 2  ,
                        child: TextField(
                          controller: targetIdEditCtrl,
                          maxLines: 1,
                          style: KFont.cardTitleStyle,
                          autofocus: false,
                          cursorColor: Colors.black,
                          cursorWidth: 2,
                          cursorHeight: 25,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(200),
                          ],
                          maxLength: null,
                          onSubmitted: (text) {},
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: ' ',
                            contentPadding: EdgeInsets.zero,
                            hintStyle: KFont.cardTitleStyle,
                            isDense: true,
                            hintMaxLines: 1,
                          ),
                          strutStyle: const StrutStyle(leading: 0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  KString.itemName,
                  style: KFont.cardProfileStyle,
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: 21,
                    child: Text(
                      KString.itemStyle,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                SizedBox(
                  width: 34,
                  child: Text(
                    KString.itemCount,
                    style: KFont.cardProfileStyle,
                  ),
                ),
                const SizedBox(
                  width: 70 - 24,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items!,
            ),
            SizedBox(
              height: 22,
              width: 22,
              child: InkWell(
                onTap: addItem,
                child: SvgPicture.asset('Svg/plus_card.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addItem() {
    //这里是往viewmodel添加数据
    test.add('test');
    refreshUi();
  }

  void delectItem(int index) {
    test.removeAt(index);
    items!.removeAt(index);
    refreshUi();
    //for (int i = 0; i <= test.length - 1; i++) {
    //  print(test[i]);
    //}
  }

  void refreshUi() {
    setState(() {});
  }
}
