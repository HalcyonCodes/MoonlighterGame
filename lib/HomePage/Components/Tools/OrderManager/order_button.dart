import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import 'package:flutter_svg/svg.dart';

class OrderButton extends StatefulWidget {
  final Function()? onTap;
  final bool? isSelect;
  final String? path;
  final String? name;

  const OrderButton(
      {super.key,
      required this.isSelect,
      required this.onTap,
      required this.path, required this.name});

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
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
            onTap: widget.onTap,
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
