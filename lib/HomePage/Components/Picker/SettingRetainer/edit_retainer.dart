import 'package:flutter/material.dart';
import 'package:moonlighter/Config/string.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import './edit_card.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_retainer_view_model.dart';
import 'dart:io';

class EditRetainer extends StatelessWidget {
  final PickerUtil pickerUtil;
  final SettingRetainerPickerViewModel viewModel;
  const EditRetainer(
      {super.key, required this.pickerUtil, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTitle(
          iconPath: 'Svg/retainer_tool.svg',
          title: KString.addRetainer,
          commit: commit,
        ),
        const SizedBox(
          height: 16,
        ),
        EditCard(
          pickerUtil: pickerUtil,
        )
      ],
    );
  }

  void commit() async {
    int statusCode = await viewModel.addRetainer(
      pickerUtil.textCtrs![0].text,
      pickerUtil.textCtrs![1].text,
      pickerUtil.textCtrs![2].text,
    );
    if (statusCode == HttpStatus.ok) {
      //1.提示成功
      //2.刷新列表
      pickerUtil.refreshRetainer!();
    } else {
      //1.提示失败
    }
  }
}
