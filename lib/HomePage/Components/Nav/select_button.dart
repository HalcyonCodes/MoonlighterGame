import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlighter/Config/index.dart';

class SelectButton extends StatelessWidget {
  final bool isSelected;
  final String iconPath;
  final Function()? onClick;
  const SelectButton({super.key, required this.isSelected, required this.iconPath, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? KColor.primaryColor : KColor.navColor,
        ),
        height: 50,
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        alignment: Alignment.center,
        child: SizedBox(
          height: 26,
          width: 26,
          child: SvgPicture.asset(iconPath, color: Colors.white,)
        ),
      ),
    );
  }
}
