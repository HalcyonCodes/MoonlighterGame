import 'package:flutter/material.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_channel_view_model.dart';
import './edit_channel.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import './future_list_channel_card.dart';

class PickerSettingChannel extends StatelessWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SettingChannelPickerViewModel viewModel =
      SettingChannelPickerViewModel();
  PickerSettingChannel({super.key, required this.pickerUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        EditChannel(pickerUtil: pickerUtil, viewModel: viewModel),
        const SizedBox(
          height: 32,
        ),
        ChannelCardListFuture(viewModel: viewModel, toolUtil: toolUtil, pickerUtil: pickerUtil,)
      ],
    );
  }
}
