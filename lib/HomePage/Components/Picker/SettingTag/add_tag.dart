import 'package:flutter/material.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import '../../../../Config/index.dart';
import './edit_card.dart';


class AddTag extends StatelessWidget {
  const AddTag({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTitle(iconPath: 'Svg/tag_tool.svg', title: KString.addTag),
          const SizedBox(height: 16),
          const EditCard(),
        ],
      ),
    );
  }
}
