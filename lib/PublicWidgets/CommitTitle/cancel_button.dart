import 'package:flutter/material.dart';
import '../../Config/index.dart';

class CancelButton extends StatelessWidget {
  final String? title;
  final Function()? ontap;

  const CancelButton({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColor.navColor,
      height: 46,
      child: InkWell(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Text(
            title!,
            style: KFont.toolTitleButtonStyle,
            strutStyle: const StrutStyle(leading: 0),
          ),
        ),
      ),
    );
  }
}
