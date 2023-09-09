import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import '../../../../Config/index.dart';
import './edit_card.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_tag_view_model.dart';

class AddTag extends StatelessWidget {
  final PickerUtil pickerUtil;
  final SettingTagPickerViewModel viewModel;

  const AddTag({super.key, required this.pickerUtil, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTitle(
            iconPath: 'Svg/tag_tool.svg',
            title: KString.addTag,
            commit: commit,
          ),
          const SizedBox(height: 16),
          EditCard(
            pickerUtil: pickerUtil,
          ),
        ],
      ),
    );
  }

  void commit() async {
    String inputText = pickerUtil.textCtrs![0].text;
    if (inputText != '') {
      int statusCode = await viewModel.addTag(inputText);

      if (statusCode == HttpStatus.ok) {
        //1.提示添加成功
        //2.刷新列表
        pickerUtil.refreshTagList!();
      }else{
        //1.提示添加失败
      }
    }
  }
}
