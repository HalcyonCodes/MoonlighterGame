import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class ShelfTitle extends StatelessWidget {
  final String itemCount;
  const ShelfTitle({super.key, required this.itemCount});

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
            SizedBox(height: 22, width: 22, child: SvgPicture.asset('Svg/shelf_tool.svg')),
            const SizedBox(width: 12,),
            Text(KString.sellingItem, style: KFont.toolTitleStyle,),
            const Expanded(child: SizedBox()),
            Text('$itemCount / 20',style: KFont.toolTitleStyle),
          ],
        ),
      ),
    );
  }
}
