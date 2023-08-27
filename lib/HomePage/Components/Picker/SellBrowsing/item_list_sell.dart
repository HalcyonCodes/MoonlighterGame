import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import './item_sell.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';

class SellItemList extends StatefulWidget {
  final String total;
  const SellItemList({super.key, required this.total});

  @override
  State<SellItemList> createState() => _SellItemListState();
}

class _SellItemListState extends State<SellItemList> {
  String? total;

  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
    total = widget.total;
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(10, (index) {
      return SellItem(
          itemName: '纤维手机', itemType: '1', itemCount: '3', itemPrice: '35000');
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 32 - 46 - 16 - 381,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Container(
              decoration: KDecoration.cardDecoration,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                          Expanded(
                              child: Text(
                            KString.itemName,
                            overflow: TextOverflow.ellipsis,
                            style: KFont.cardProfileStyle,
                            maxLines: 1,
                          )),
                          const SizedBox(
                            width: 24,
                          ),
                          SizedBox(
                              width: 21,
                              child: Text(
                                KString.itemStyle,
                                overflow: TextOverflow.ellipsis,
                                style: KFont.cardProfileStyle,
                                maxLines: 1,
                              )),
                          const SizedBox(
                            width: 24,
                          ),
                          SizedBox(
                              width: 35,
                              child: Text(
                                KString.itemCount,
                                overflow: TextOverflow.ellipsis,
                                style: KFont.cardProfileStyle,
                                maxLines: 1,
                              )),
                          const SizedBox(
                            width: 24,
                          ),
                          SizedBox(
                              width: 129,
                              child: Text(
                                KString.itemPrice,
                                overflow: TextOverflow.ellipsis,
                                style: KFont.cardProfileStyle,
                                maxLines: 1,
                              ))
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: items!,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            KString.total,
                            style: KFont.cardProfileStyle,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            total!,
                            style: KFont.itemListStyle,
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
