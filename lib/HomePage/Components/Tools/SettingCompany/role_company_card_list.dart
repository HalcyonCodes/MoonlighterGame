import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../Util/util_tools.dart';
import './role_company_card.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_company_view_model.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_company_from_json_model.dart';

//expansion的列表

class RoleCompanyCardList extends StatefulWidget {
  final SettingCompanyToolViewModel viewModel;
  final ToolUtil util;

  const RoleCompanyCardList(
      {super.key, required this.util, required this.viewModel});

  @override
  State<RoleCompanyCardList> createState() => _RoleCompanyCardListState();
}

class _RoleCompanyCardListState extends State<RoleCompanyCardList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
    //注册
    widget.util.setListFuncSettingCompanySetSelect([]);
    widget.util.setFuncInsertCompany(onAdd);
  }

  @override
  Widget build(BuildContext context) {
    //初始化
    items = List.generate(
        widget.viewModel.settingCompanyToolModel!.data.roles.length, (index) {
      return RoleCompanyCard(
        key: UniqueKey(),
        util: widget.util,
        roleId:
            widget.viewModel.settingCompanyToolModel!.data.roles[index].roleId,
        roleName: widget
            .viewModel.settingCompanyToolModel!.data.roles[index].roleName,
        roleChannel: widget
            .viewModel.settingCompanyToolModel!.data.roles[index].roleChannel,
        companyId: widget.viewModel.settingCompanyToolModel!.data.roles[index]
            .company?.companyId,
        companyName: widget.viewModel.settingCompanyToolModel!.data.roles[index]
            .company?.companyName,
        companyChannel: widget.viewModel.settingCompanyToolModel!.data
            .roles[index].company?.companyChannel,
        companyProfile: widget.viewModel.settingCompanyToolModel!.data
            .roles[index].company?.companyDesc,
        memberCount: widget.viewModel.settingCompanyToolModel!.data.roles[index]
            .company?.companyMembers,
        marketValue: widget.viewModel.settingCompanyToolModel!.data.roles[index]
            .company?.companyMarkerValue,
        onTap: () {
          onCardTap(index);
        },
        onRemove: () {
          onRemove(index);
        },
      );
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height -
          24 -
          24 -
          46 -
          (55 + 8 + 17 + 16) * 3 -
          32 -
          46 -
          16,
      child: ClipPath(
          clipper: RectangleClipper(),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              clipBehavior: Clip.none,
              children: items!,
            ),
          )),
    );
  }

  void onCardTap(int index) {
    for (int i = 0;
        i <= widget.util.listFuncSettingCompanySetSelect!.length - 1;
        i++) {
      widget.util.listFuncSettingCompanySetSelect![i](false);
    }
    //widget.util.listFuncSettingCompanySetSelect![index](true);
    widget.util.setCurrentRoleIndex(index);
  }

  void onRemove(int index) {
    widget.viewModel.removeCompany(
        widget.viewModel.settingCompanyToolModel!.data.roles[index]);
    refreshUi();
  }

  void onAdd(int roleIndex, Company company) {
    Role role = widget.viewModel.settingCompanyToolModel!.data.roles[roleIndex];
    if (role.company == null) {
      widget.viewModel.addCompany(role, company);
      refreshUi();
    }
  }

  refreshUi() {
    setState(() {});
  }
}
