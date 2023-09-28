import 'package:flutter/material.dart';

import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_channel_view_model.dart';
import '../../Util/util_tools.dart';
import './list_channel_card.dart';

class ChannelCardListFuture extends StatefulWidget {
  final SettingChannelPickerViewModel viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  const ChannelCardListFuture(
      {super.key,
      required this.viewModel,
      required this.toolUtil,
      required this.pickerUtil});

  @override
  State<ChannelCardListFuture> createState() => _ChannelCardListFutureState();
}

class _ChannelCardListFutureState extends State<ChannelCardListFuture> {
  @override
  void initState() {
    super.initState();
    widget.pickerUtil.setFuncRefreshSettingChannelCardListFuture(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(),
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
                  viewModel: widget.viewModel, toolUtil: widget.toolUtil, pickerUtil: widget.pickerUtil,);
          }
        });
  }

  void refreshUi() {
    setState(() {});
  }
}
