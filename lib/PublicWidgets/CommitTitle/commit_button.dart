import 'package:flutter/material.dart';
import '../../Config/index.dart';

class CommitButton extends StatefulWidget {
  final Function()? onLongTap;
  final String? title;
  const CommitButton({super.key, required this.onLongTap, required this.title});

  @override
  State<CommitButton> createState() => _CommitButtonState();
}

class _CommitButtonState extends State<CommitButton> {

  String? title;
  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
        onLongPress: widget.onLongTap,
    child:Container(
     
      decoration: BoxDecoration(
        color: KColor.primaryColor,
        borderRadius:  const BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16))
      ),
      height: 46,
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
