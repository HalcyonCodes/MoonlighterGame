import 'package:flutter/material.dart';
import 'package:moonlighter/Config/string.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import './edit_card.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_retainer_view_model.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';

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
    PickerRetainer retainer = PickerRetainer();
    retainer.retainerId = pickerUtil.textCtrs![0].text;
    retainer.retainerName = pickerUtil.textCtrs![1].text;
    retainer.retainerDesc = pickerUtil.textCtrs![2].text;
    retainer.lastDispatchTime = '1992/9/4';

    viewModel.insertRetainerToList(retainer);
    pickerUtil.refreshRetainer!();
  }
}
