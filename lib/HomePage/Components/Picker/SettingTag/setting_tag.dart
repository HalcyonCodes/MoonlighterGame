import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Picker/SettingTag/future_tag_list.dart';
import './add_tag.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';
import '../../../model/ViewModel/PickerViewModel/setting_tag_view_model.dart';


class PickerSettingTag extends StatelessWidget {

  final SettingTagPickerViewModel viewModel = SettingTagPickerViewModel();
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;

  PickerSettingTag({super.key, required this.pickerUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTag(pickerUtil: pickerUtil, viewModel: viewModel,),
          const SizedBox(
            height: 32,
          ),
          PickerTagListFuture(
            pickerUtil: pickerUtil, 
            toolUtil: toolUtil,
            viewModel: viewModel,)
        ],
      ),
    );
  }
}
