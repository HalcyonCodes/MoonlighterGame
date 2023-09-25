import 'package:flutter/material.dart';

import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_role_from_json_model.dart';
import './role_card_picker.dart';
import '../.././../Model/ViewModel/PickerViewModel/setting_role_view_model.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_role_from_json_model.dart';

class PickerRoleList extends StatefulWidget {
  final SettingRolePickerViewModel? viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  const PickerRoleList(
      {super.key,
      required this.viewModel,
      required this.toolUtil,
      required this.pickerUtil});

  @override
  State<PickerRoleList> createState() => _PickerRoleListState();
}

class _PickerRoleListState extends State<PickerRoleList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
    widget.pickerUtil.setFuncRefreshPickerRoleList(refreshUi);
    widget.pickerUtil.setFuncInsertPickerRoleListRole(insertPickerRole);
    widget.pickerUtil.setFuncGetPickerRoleListToJsonModel(getToJsonModel);
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel!.settingRolePickerModel!.data.roles.length, (index) {
      return PickerRoleCard(
        id: widget.viewModel!.settingRolePickerModel!.data.roles[index].roleId,
        category: widget
            .viewModel!.settingRolePickerModel!.data.roles[index].roleCategory,
        name: widget
            .viewModel!.settingRolePickerModel!.data.roles[index].roleName,
        profile: widget
            .viewModel!.settingRolePickerModel!.data.roles[index].roleDesc,
        addOnTap: () {
          insertToolRole(
              widget.viewModel!.settingRolePickerModel!.data.roles[index]);
        },
        removeOnTap: () {
          delectRole(
              widget.viewModel!.settingRolePickerModel!.data.roles[index]);
        },
      );
    });
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 288 - 16 - 46 - 32,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            clipBehavior: Clip.none,
            children: items!,
          ),
        ),
      ),
    );
  }

  void delectRole(PickerRole vRole) async {
    widget.viewModel!.removeRole(vRole);
    refreshUi();
  }

  void insertToolRole(PickerRole vRole) {
    if (widget.toolUtil.currentChannelIndex != null) {
      Role role = Role();
      role.roleId = vRole.roleId;
      role.roleCategory = vRole.roleCategory;
      role.roleDesc = vRole.roleDesc;
      role.roleName = vRole.roleName;
      widget.toolUtil
          .listFuncInsertRole![widget.toolUtil.currentChannelIndex!](role);
      widget.viewModel!.removeRole(vRole);
      widget.toolUtil.listFuncChangeMemberCount![
          widget.toolUtil.currentChannelIndex!](true);
      refreshUi();
    }
  }

  void insertPickerRole(PickerRole vRole) {
    widget.viewModel!.insertRole(vRole);

    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  Map<String, dynamic> getToJsonModel() {
    widget.viewModel!.toJson();
    return widget.viewModel!.postMap!;
  }
}
