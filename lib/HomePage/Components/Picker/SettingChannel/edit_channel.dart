import 'package:flutter/material.dart';
import 'package:moonlighter/Config/string.dart';
import '../../../../PublicWidgets/AddTitle/add_title.dart';
import './edit_card.dart';
import '../../Util/util_picker.dart';
import '../../../Model/FromJsonModel/PickerFromJsonModel/setting_channel_from_json_model.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_channel_view_model.dart';

class EditChannel extends StatelessWidget {
  final PickerUtil pickerUtil;
  final SettingChannelPickerViewModel viewModel;
  const EditChannel(
      {super.key, required this.pickerUtil, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTitle(
          iconPath: 'Svg/channel_tool.svg',
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
    PickerChannel pChannel = PickerChannel();
    pChannel.channelId = '';
    pChannel.channelClassName = pickerUtil.textCtrs![0].text;
    pChannel.channelName = pickerUtil.textCtrs![1].text;

    viewModel.addItem(pChannel);

    pickerUtil.refreshRetainer!();
  }
}
