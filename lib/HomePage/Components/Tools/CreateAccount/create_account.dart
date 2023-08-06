import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';
import './create_card.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         CommitTitle(iconPath: 'Svg/account_tool.svg', title: KString.createAccount),
         const SizedBox(height: 16,),
         CreateCard(id: 'dx131324', name: 'ycy13642220203')
         
      ],
    );
  }
}