

import 'package:flutter/material.dart';
import '../../../../Config/index.dart';

class SellItem extends StatelessWidget {
  final String itemName;
  final String itemType;
  final String itemCount;
  final String itemPrice;

  const SellItem({super.key, required this.itemName, required this.itemType, required this.itemCount, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              itemName,
              overflow: TextOverflow.ellipsis,
              style: KFont.itemListStyle,
              maxLines: 1,
          )),
          const SizedBox(width: 24,),
          SizedBox(width: 21, child: 
            Text(
              itemType,
              overflow: TextOverflow.ellipsis,
              style: KFont.itemListStyle,
              maxLines: 1,
          )),
          const SizedBox(width: 24,),
          SizedBox(width: 35, child: 
            Text(
              itemCount,
              overflow: TextOverflow.ellipsis,
              style: KFont.itemListStyle,
              maxLines: 1,
          )),
          const SizedBox(width: 24,),
          SizedBox(width: 129, child:
            Text(
              itemPrice,
              overflow: TextOverflow.ellipsis,
              style: KFont.itemListStyle,
              maxLines: 1,
            )
          )
    
        ],
      ),
    );
  }
}