import 'dart:io';

import 'package:flutter/material.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_channel_from_json_model.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_channel_view_model.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './channel_card.dart';
import '../../Util/util_picker.dart';

class ChannelCardList extends StatefulWidget {
  final SettingChannelPickerViewModel viewModel;
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  const ChannelCardList(
      {super.key,
      required this.viewModel,
      required this.toolUtil,
      required this.pickerUtil});

  @override
  State<ChannelCardList> createState() => _ChannelCardListState();
}

class _ChannelCardListState extends State<ChannelCardList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel.settingChannelPickerModel!.data.channels.length,
        (index) {
      return ChannelCard(
        channelName: widget.viewModel.settingChannelPickerModel!.data
            .channels[index].channelName,
        channelClassName: widget.viewModel.settingChannelPickerModel!.data
            .channels[index].channelClassName,
        onAddTap: () {
          addOnTap(index);
        },
        onCloseTap: () {
          closeOnTap(index);
        },
      );
    });
    return SizedBox(
        height: MediaQuery.of(context).size.height <= 1920
            ? MediaQuery.of(context).size.height - 24 - 24 - 46 - 16 - 146 - 32
            : MediaQuery.of(context).size.height - 24 - 24 - 46 - 16 - 146 - 32,
        child: ClipPath(
          clipper: RectangleClipper(),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              clipBehavior: Clip.none,
              children: items!,
            ),
          ),
        ));
  }

  void addOnTap(int index) {
    Channel channel = Channel();
    channel.channelId = widget
        .viewModel.settingChannelPickerModel!.data.channels[index].channelId;
    channel.channelClassName = widget.viewModel.settingChannelPickerModel!.data
        .channels[index].channelClassName;
    channel.channelName = widget
        .viewModel.settingChannelPickerModel!.data.channels[index].channelName;
    widget.toolUtil.addChannel!(channel);
    refreshUi();
  }

  void closeOnTap(int index) async {
    int statusCode = await widget.viewModel.removeItem(
        widget.viewModel.settingChannelPickerModel!.data.channels[index]);
    if (statusCode == HttpStatus.ok) {
      //1.提示成功
      //2.刷新列表
      widget.pickerUtil.refreshSettingChannelCardListFuture!();
    } else {
      //1.提示失败
    }
  }

  void refreshUi() {
    setState(() {});
  }
}
