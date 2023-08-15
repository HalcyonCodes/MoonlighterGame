import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Config/index.dart';
import './item_gil_input.dart';


//制作订单
class ResourceTransferOrder extends StatefulWidget {
  final String? orderId;
  final String? sourceId;
  final String? targetId;


  const ResourceTransferOrder({super.key, this.orderId, this.sourceId, this.targetId});

  @override
  State<ResourceTransferOrder> createState() => _ResourceTransferOrderState();
}

class _ResourceTransferOrderState extends State<ResourceTransferOrder> {
  String? orderId;
  String? sourceId;
  String? targetId;

  TextEditingController? orderIdEditCtrl;
  TextEditingController? sourceIdEditCtrl;
  TextEditingController? targetIdEditCtrl;

  List<Widget>? items;

  //test
  List<String> test = ['1234566666',];

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
      return ItemGilInput(
        key: UniqueKey(),
        gil: test[index],
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
              KString.resourceTransferOrder,
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
                style: KFont.searchBarStyle,
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
                          style: KFont.searchBarStyle,
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
                          style: KFont.searchBarStyle,
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
                  KString.itemGil,
                  style: KFont.cardProfileStyle,
                ),
                const Expanded(child: SizedBox()),
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
