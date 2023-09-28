import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_channel_view_model.dart';
import './list_channel_card.dart';
import '../../Util/util_picker.dart';

class ChannelCardListFuture extends StatelessWidget {
  final SettingChannelToolViewModel viewMode;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  const ChannelCardListFuture(
      {super.key, required this.viewMode, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewMode.refresh(toolUtil.listSelectId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.active:
              return Text('active');
            case ConnectionState.waiting:
              return Text('waiting');
            case ConnectionState.done:
              return ChannelCardList(
                viewModel: viewMode,
                pickerUtil: pickerUtil,
                toolUtil: toolUtil,
              );
          }
        });
  }
}
