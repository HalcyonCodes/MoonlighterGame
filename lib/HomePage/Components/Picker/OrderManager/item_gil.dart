import 'package:flutter/material.dart';
import '../../../../Config/index.dart';

//菜单下面带价格输入的菜单项
class ItemGil extends StatefulWidget {
  final String? gil;

  const ItemGil({
    super.key,
    this.gil,
  });

  @override
  State<ItemGil> createState() => _ItemGilState();
}

class _ItemGilState extends State<ItemGil> {

  String? gil;

  @override
  void initState() {
    super.initState();
    gil = widget.gil;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 24) / 24 * 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SizedBox(
              height: 22,
              child: Text(gil!, style: KFont.itemListStyle,)
               
              ),
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
