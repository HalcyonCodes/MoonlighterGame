import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';

class Item extends StatelessWidget {
  final String itemName;
  final String itemCount;
  final String isHq;
  const Item(
      {super.key,
      required this.isHq,
      required this.itemName,
      required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
                height: 22,
                child: Text(
                  itemName,
                  style: KFont.itemListStyle,
                )),
          ),
          const SizedBox(width: 24,),
          SizedBox(width: 21,child: Text(isHq, style: KFont.itemListStyle,),),
          const SizedBox(width: 24,),
          SizedBox(width: 35, child: Text(itemCount, style: KFont.itemListStyle,),),
        ],
      ),
    );
  }
}
