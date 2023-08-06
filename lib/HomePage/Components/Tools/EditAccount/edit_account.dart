import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';
import 'edit_card.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         CommitTitle(iconPath: 'Svg/edit_tool.svg', title: KString.editAccount),
         const SizedBox(height: 16,),
         EditCard(id: 'dx131324', name: '一号雇员')
         
      ],
    );
  }
}