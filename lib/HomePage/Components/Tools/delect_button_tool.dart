import 'package:flutter/material.dart';
import '../../../Config/index.dart';
import 'package:flutter_svg/svg.dart';

class DelectButton extends StatefulWidget {
  final Function()? onLongTap;
  final bool? isSelect;
  final String? path;
  final String? name;

  const DelectButton(
      {super.key,
      required this.isSelect,
      required this.onLongTap,
      required this.path, required this.name});

  @override
  State<DelectButton> createState() => _DelectButtonState();
}

class _DelectButtonState extends State<DelectButton> {
  String? path;
  String? name;

  @override
  void initState() {
    super.initState();
    path = widget.path;
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onLongPress: widget.onLongTap,
            borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: widget.isSelect == false
                ? KDecoration.cardDecoration
                : KDecoration.cardSelectedDecoration,
            height: 55,
            width: 55,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 31,
                width: 31,
                child: SvgPicture.asset(path!, color: widget.isSelect == true ? Colors.white : Colors.black,)),
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Text(name!, style: KFont.toolButtonStyle,)
        ]
      ),
    );
  }
}
