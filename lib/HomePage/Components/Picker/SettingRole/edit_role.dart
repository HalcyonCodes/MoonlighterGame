import 'package:flutter/material.dart';
import 'package:moonlighter/Config/string.dart';

import '../../../../PublicWidgets/AddTitle/add_title.dart';
import './edit_card.dart';

class EditRole extends StatelessWidget {
  const EditRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AddTitle(
            iconPath: 'Svg/role_tool.svg',
            title: KString.addRole,
            commit: commit,
          ),
          const SizedBox(
            height: 16,
          ),
          EditCard(),
        ]);
  }
  void commit(){

  }
}
