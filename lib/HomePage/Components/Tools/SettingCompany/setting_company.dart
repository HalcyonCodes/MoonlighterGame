import 'package:flutter/material.dart';
import '../../Util/util_tools.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import './role_company_card_list.dart';

class SettingCompany extends StatelessWidget {
  final ToolUtil toolUtil;
  const SettingCompany({super.key, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
            iconPath: 'Svg/company_tool.svg', title: KString.settingCompany),
        const SizedBox(
          height: 16,
        ),
        RoleCompanyCardList(util: toolUtil),
      ],
    );
  }
}
