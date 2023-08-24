import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class StoreTitle extends StatelessWidget {
  final String itemCount;
  const StoreTitle({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22, width: 22, child: SvgPicture.asset('Svg/item_tool.svg')),
            const SizedBox(width: 12,),
            Text(KString.storeItem, style: KFont.toolTitleStyle,),
            const Expanded(child: SizedBox()),
            Text('$itemCount / 140',style: KFont.toolTitleStyle),
          ],
        ),
      ),
    );
  }
}
