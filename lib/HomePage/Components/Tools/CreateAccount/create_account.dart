import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';
import './create_card.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_tools.dart';

class CreateAccount extends StatelessWidget {
  final ToolUtil toolUtil;

  const CreateAccount({super.key, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
          cancel: cancel,
          commit: commit,
            iconPath: 'Svg/account_tool.svg', title: KString.createAccount),
        const SizedBox(
          height: 16,
        ),
        const CreateCard(id: '', name: '')
      ],
    );
  }

  void commit() {

  }

  void cancel() {
    toolUtil.
  }
}
