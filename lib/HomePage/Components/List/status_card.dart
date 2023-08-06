import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moonlighter/Config/index.dart';

class CardStatus extends StatefulWidget {
  final bool? isSelect;
  final bool? isCardSelect;
  final String? path;
  final Function()? onTap;

  const CardStatus(
      {super.key,
      required this.isCardSelect,
      required this.isSelect,
      required this.path,
      required this.onTap});

  @override
  State<CardStatus> createState() => _CardStatusState();
}

class _CardStatusState extends State<CardStatus> {
 
  String? path;
  Function()? ontap;

  @override
  void initState() {
    super.initState();
    path = widget.path;
    ontap = widget.onTap;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      //onTap: widget.onTap,
      onLongPress: widget.onTap,
      child: SizedBox(
          height: 26,
          width: 26,
          child: SvgPicture.asset(path!,
              color: widget.isCardSelect == true
                  ? Colors.white
                  : widget.isSelect == true
                      ? KColor.primaryColor
                      : Colors.black)),
    );
  }
}
