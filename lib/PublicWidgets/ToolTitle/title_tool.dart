import 'package:flutter/material.dart';
import '../../Config/index.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolTitle extends StatelessWidget {
  final String? name;
  final String? iconPath;
  const ToolTitle({super.key, required this.iconPath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        child: Row(
          children: [
            SizedBox(
              height: 22,
              width: 22,
              child: SvgPicture.asset(iconPath!),
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(height: 22, child: 
              Text(name!, style: KFont.toolTitleStyle,)
            ,)
          ],
        ),
      ),
    );
  }
}
