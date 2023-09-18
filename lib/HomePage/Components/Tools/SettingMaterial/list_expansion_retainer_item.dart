import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import 'expansion_retainer_item.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';

import '../../../Model/ViewModel/ToolViewModel/setting_material_view_model.dart';

//包裹所有角色-雇员手风琴的列表
class ItemRetainerList extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingMaterialToolViewModel viewModel;


  const ItemRetainerList({super.key, required this.toolUtil, required this.viewModel, required this.pickerUtil});

  @override
  State<ItemRetainerList> createState() => _ItemRetainerListState();
}

class _ItemRetainerListState extends State<ItemRetainerList> {
    List<ItemExpansionRetainer>? items;

  @override
  void initState() {
    super.initState();
    //初始化
    widget.toolUtil.setListFuncSettingShelfBodySelected([]);
    widget.toolUtil.setListFuncSettingShelfHeadSelected([]);
  }

  @override
  Widget build(BuildContext context) {
    //初始化数据的地方
    items = List.generate(widget.viewModel.settingMaterialToolModel!.data!.roles!.length, (index) {
      return ItemExpansionRetainer(
        roleId: widget.viewModel.settingMaterialToolModel!.data!.roles![index].roleId,
        roleName: widget.viewModel.settingMaterialToolModel!.data!.roles![index].roleName,
        roleChannel: widget.viewModel.settingMaterialToolModel!.data!.roles![index].roleChannel,
        toolUtil: widget.toolUtil,
        role: widget.viewModel.settingMaterialToolModel!.data!.roles![index],
        viewModel: widget.viewModel,
        pickerUtil: widget.pickerUtil,
        headTap: () {
          onTap(index);
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
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
          ),
        ),
      ),
    );
  }

  void onTap(index) {
    for (int i = 0;
        i <= widget.toolUtil.listFuncSettingMaterialHeadSelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSettingMaterialHeadSelected![i](false);
    }
    widget.toolUtil.listFuncSettingMaterialHeadSelected![index](true);

    //清空body选中
    for (int i = 0;
        i <= widget.toolUtil.listFuncSettingMaterialBodySelected!.length - 1;
        i++) {
      widget.toolUtil.listFuncSettingMaterialBodySelected![i](false);
    }

    

  }
}
