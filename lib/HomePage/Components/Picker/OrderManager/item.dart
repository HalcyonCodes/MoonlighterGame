import 'package:flutter/material.dart';
import '../../../../Config/index.dart';

class Item extends StatefulWidget {
  final String? itemName;
  final String? itemType;
  final String? itemCount;
  final bool? isStart;
  final Function()? delectOnTap;

  const Item(
      {super.key,
      required this.isStart,
      this.itemName,
      this.itemType,
      this.itemCount,
      this.delectOnTap});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  String? itemName;
  String? itemType;
  String? itemCount;
  bool? isStart;

  @override
  void initState() {
    super.initState();
    itemName = widget.itemName;
    itemType = widget.itemType;
    itemCount = widget.itemCount;
    isStart = widget.isStart;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 24) / 24 * 8,
      margin: isStart == true ? const EdgeInsets.only(top: 0) : const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
                height: 22,
                child: Text(
                  itemName!,
                  style: KFont.itemListStyle,
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
                itemType!,
                style: KFont.itemListStyle,
              )),
          const SizedBox(
            width: 24,
          ),
          SizedBox(
              width: 35,
              child: Text(
                itemCount!,
                style: KFont.itemListStyle,
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
