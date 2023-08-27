import 'package:flutter/material.dart';
import '../../../../Config/index.dart';

//菜单下面带价格输入的菜单项
class ItemPrice extends StatefulWidget {
  final String? itemName;
  final String? itemType;
  final String? itemCount;
  final String? itemPrice;

  final Function()? delectOnTap;

  const ItemPrice(
      {super.key,
      this.itemName,
      this.itemType,
      this.itemCount,
      this.itemPrice,
      this.delectOnTap});

  @override
  State<ItemPrice> createState() => _ItemPriceState();
}

class _ItemPriceState extends State<ItemPrice> {


  String? itemName;
  String? itemType;
  String? itemCount;
  String? itemPrice;

  @override
  void initState() {
    super.initState();
    
    itemName = widget.itemName;
    itemType = widget.itemType;
    itemCount = widget.itemCount;
    itemPrice = widget.itemPrice;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 24) / 24 * 8,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              height: 22,
              child: Text(itemName!, style: KFont.itemListStyle,)
              ),
            
          ),
          // const Expanded(child: SizedBox()),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 21,
            height: 22,
            child: Text(itemType!, style: KFont.itemListStyle,),
          ),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 34,
            child: Text(itemCount!, style: KFont.itemListStyle,)
          ),
           const SizedBox(
            width: 24,
          ),
          SizedBox(
            width: 70,
            child: Text(itemPrice!, style: KFont.itemListStyle,)
          ), 
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

