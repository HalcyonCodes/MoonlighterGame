import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';

class CardTag extends StatelessWidget {
  final String? tag;
  final bool? isSelect;
  const CardTag({super.key, required this.isSelect, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[Container(
        height: 26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelect == true ? Colors.white : KColor.primaryColor,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
        child: SizedBox(
          height: 16,
          child: Text(tag!, style: isSelect == true ? KFont.tagSelectedStyle : KFont.tagStyle,),
        ),
      ),]
    );
  }
}
