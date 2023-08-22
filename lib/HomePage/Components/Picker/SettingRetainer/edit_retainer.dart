

import 'package:flutter/material.dart';
import 'package:moonlighter/Config/string.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import './edit_card.dart';

class EditRetainer extends StatelessWidget {
  const EditRetainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTitle(iconPath: 'Svg/retainer_tool.svg', title: KString.addRetainer,),
        const SizedBox(height: 16,),
        EditCard()
      ],
    );
  }
}