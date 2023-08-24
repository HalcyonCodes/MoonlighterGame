import 'package:flutter/material.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_picker.dart';

class ShelfTitle extends StatefulWidget {
  final String itemCount;
  final PickerUtil pickerUtil;

  const ShelfTitle({super.key, required this.itemCount, required this.pickerUtil});

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
    widget.pickerUtil.setFuncChangeSettingShelfTitleCount(changeItemCount);
  }

  @override
  Widget build(BuildContext context) {
    return CommitTitle(
        iconPath: 'Svg/shelf_tool.svg', title: '设置货架内容 ${itemCount!} / 20');
  }

  void changeItemCount(String newItemCount) {
    itemCount = newItemCount;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }
  
  
}
