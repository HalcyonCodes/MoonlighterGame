import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import './item.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = List.generate(20, (index) {
      return Item(isHq: '1', itemName: 'itemName', itemCount: '99');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: Text(KString.itemName, style: KFont.cardProfileStyle,)),
                const SizedBox(width: 24,),
                SizedBox(width: 21, child: Text(KString.itemStyle, style: KFont.cardProfileStyle,),),
                const SizedBox(width: 24,),
                SizedBox(width: 34, child: Text(KString.itemCount, style: KFont.cardProfileStyle,),),
              ]),
            const SizedBox(height: 4,),
            Column(
              children: items!,
            )

          ],
        ),
      ),
    );
  }
}
