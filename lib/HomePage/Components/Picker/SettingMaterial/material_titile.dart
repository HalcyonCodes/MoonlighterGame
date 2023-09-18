import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Util/util_tools.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';

class MaterialTitle extends StatefulWidget {
  final String itemCount;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SettingMaterialPickerViewModel viewModel;

  const MaterialTitle({super.key, required this.itemCount, required this.pickerUtil, required this.viewModel, required this.toolUtil});

  @override
  State<MaterialTitle> createState() => _MaterialTitleState();
}

class _MaterialTitleState extends State<MaterialTitle> {
  String? itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = widget.itemCount;

    //注册
    widget.pickerUtil.setFuncChangeSettingMaterialTitleCount(changeItemCount);
  }

  @override
  Widget build(BuildContext context) {
    return CommitTitle(
        iconPath: 'Svg/material_tool.svg', title: '设置仓库素材内容 ${itemCount!} / 175', cancel: cancel, commit: commit,);
  }

  void changeItemCount(String newItemCount) {
    itemCount = newItemCount;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }
  
  
 void commit() async {
    int statusCode = await widget.viewModel.updateCatalog();

    if (statusCode == HttpStatus.ok) {
      //1.提示成功
      //2.关闭窗口
      widget.toolUtil.setCurrentRetainerId(null);
      widget.pickerUtil.refreshSettingShelfFuture!();
      widget.pickerUtil.refreshRetainerSearch!();
      widget.viewModel.initModel();
    } else {
      //1.提示失败
    }
  }

  void cancel() {
    widget.toolUtil.setCurrentRetainerId(null);
    widget.pickerUtil.refreshSettingShelfFuture!();
    widget.pickerUtil.refreshRetainerSearch!();
    widget.viewModel.initModel();
  }
}
