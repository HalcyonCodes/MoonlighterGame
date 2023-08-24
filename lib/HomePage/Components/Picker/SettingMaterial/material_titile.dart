import 'package:flutter/material.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_picker.dart';

class MaterialTitle extends StatefulWidget {
  final String itemCount;
  final PickerUtil pickerUtil;

  const MaterialTitle({super.key, required this.itemCount, required this.pickerUtil});

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
        iconPath: 'Svg/material_tool.svg', title: '设置仓库素材内容 ${itemCount!} / 20');
  }

  void changeItemCount(String newItemCount) {
    itemCount = newItemCount;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }
  
  
}
