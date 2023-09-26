import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';

class ShelfTitle extends StatefulWidget {
  final String itemCount;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SettingShelfPickerViewModel viewModel;

  const ShelfTitle(
      {super.key,
      required this.itemCount,
      required this.pickerUtil,
      required this.toolUtil,
      required this.viewModel});

  @override
  State<ShelfTitle> createState() => _ShelfTitleState();
}

class _ShelfTitleState extends State<ShelfTitle> {
  String? itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = widget.itemCount;

    //注册
    widget.pickerUtil.setFuncRefreshSettingShelfCount(changeItemCount);

  }

  @override
  Widget build(BuildContext context) {
    return CommitTitle(
      iconPath: 'Svg/shelf_tool.svg',
      title: '设置货架内容 ${itemCount!} / 20',
      cancel: cancel,
      commit: commit,
    );
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
    //widget.toolUtil.changeTool!(15);
    //widget.pickerUtil.changePickerCurrentIndex!(15);
  }

  void cancel() {
    widget.toolUtil.setCurrentRetainerId(null);
    widget.pickerUtil.refreshSettingShelfFuture!();
    widget.pickerUtil.refreshRetainerSearch!();
    widget.viewModel.initModel();
    //widget.toolUtil.changeTool!(15);
    //widget.pickerUtil.changePickerCurrentIndex!(15);
  }



}
