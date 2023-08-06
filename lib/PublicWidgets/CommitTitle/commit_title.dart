import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Config/index.dart';
import 'cancel_button.dart';
import 'commit_button.dart';

class CommitTitle extends StatelessWidget {

  final String? iconPath;
  final String? title;

  const CommitTitle(
      {super.key, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: SizedBox(
                height: 22,
                width: 22,
                child: SvgPicture.asset(iconPath!),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: SizedBox(
                height: 22,
                child: Text(
                  title!,
                  style: KFont.toolTitleStyle,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            CancelButton(title: KString.cancel, ontap: cancel),
            CommitButton(onLongTap: commit, title: KString.commit),
          ],
        ),
      ),
    );

  }

  void cancel(){

  }

  void commit(){

  }



}
