import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Util/util_tools.dart';

import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_channel_view_model.dart';
import './channel_card.dart';
import '../../Util/util_picker.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_channel_from_json_model.dart';

class ChannelCardList extends StatefulWidget {
  final SettingChannelToolViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  const ChannelCardList(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State<ChannelCardList> createState() => _ChannelCardListState();
}

class _ChannelCardListState extends State<ChannelCardList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];

    widget.toolUtil.setFuncAddChannel(addItem);
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel.settingChannelToolModel!.data.channels.length,
        (index) {
      return ChannelCard(
          onDownTap: () {
            downOnTap(index);
          },
          onUpTap: () {
            upOnTap(index);
          },
          onRemoveTap: () {
            removeOnTap(index);
          },
          channelName: widget.viewModel.settingChannelToolModel!.data
              .channels[index].channelName,
          channelClassName: widget.viewModel.settingChannelToolModel!.data
              .channels[index].channelClassName);
    });
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          24 -
          24 -
          46 -
          (55 + 8 + 17 + 16) * 3 -
          32 -
          46 -
          16,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
          ),
        ),
      ),
    );
  }

  void upOnTap(int index) {
    if (index <= 0) {
    } else {
      widget.viewModel.switchItem(
          widget.viewModel.settingChannelToolModel!.data.channels[index],
          widget.viewModel.settingChannelToolModel!.data.channels[index - 1]);
    }
    refreshUi();
  }

  void downOnTap(int index) {
    if (index >=
        widget.viewModel.settingChannelToolModel!.data.channels.length - 1) {
    } else {
      widget.viewModel.switchItem(
          widget.viewModel.settingChannelToolModel!.data.channels[index],
          widget.viewModel.settingChannelToolModel!.data.channels[index + 1]);
    }
    refreshUi();
  }

  void removeOnTap(int index) {
    //移除
    widget.viewModel.removeItem(
        widget.viewModel.settingChannelToolModel!.data.channels[index]);
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  void addItem(Channel channel) {
    widget.viewModel.settingChannelToolModel!.data.channels.firstWhere(
        (element) {
      return (channel.channelName == element.channelName) &&
          (channel.channelClassName == element.channelClassName);
    }, orElse: () {
      widget.viewModel.addItem(channel);
      refreshUi();
      return channel;
    });
  }
}
