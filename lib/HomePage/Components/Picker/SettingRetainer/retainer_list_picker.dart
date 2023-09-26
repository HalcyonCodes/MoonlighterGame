import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Model/FromJsonModel/PickerFromJsonModel/setting_retainer_from_json_model.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './retainer_card_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_retainer_view_model.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/setting_retainer_from_json_model.dart';

class PickerRetainerList extends StatefulWidget {
  final SettingRetainerPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  const PickerRetainerList(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State<PickerRetainerList> createState() => _PickerRetainerListState();
}

class _PickerRetainerListState extends State<PickerRetainerList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();

    //注册
    widget.pickerUtil.setFuncInsertRetainer(insertRetainer);
    widget.pickerUtil.setFuncGetPickerRetainerToJsonModel(toJson);
    widget.pickerUtil.setFuncRefreshRetainer(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel.settingRetainerPickerModel!.data!.retainers!.length,
        (index) {
      return PickerRetainerCard(
          retainerName: widget.viewModel.settingRetainerPickerModel!.data!
              .retainers![index].retainerName,
          lastUseDate: widget.viewModel.settingRetainerPickerModel!.data!
              .retainers![index].lastDispatchTime,
          id: widget.viewModel.settingRetainerPickerModel!.data!
              .retainers![index].retainerId,
          profile: widget.viewModel.settingRetainerPickerModel!.data!
              .retainers![index].retainerDesc,
          addOnTap: () {
            addTap(index);
          },
          closeOnTap: () {
            closeTap(index);
          });
    });
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 16 - 217 - 32,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(
              clipBehavior: Clip.none,
              children: items!,
            )),
      ),
    );
  }

  void addTap(int index) {
    if (widget.toolUtil.currentRoleIndex != -1) {
      Retainer retainer = Retainer();
      PickerRetainer pRetainer =
          widget.viewModel.settingRetainerPickerModel!.data!.retainers![index];
      retainer.retainerId = pRetainer.retainerId;
      retainer.retainerName = pRetainer.retainerName;
      retainer.retainerDesc = pRetainer.retainerDesc;
      retainer.lastDispatchTime = pRetainer.lastDispatchTime;

      widget.toolUtil
          .listFuncInsertRetainer![widget.toolUtil.currentRoleIndex](retainer);
      widget.viewModel.removeRetainerFromList(
          widget.viewModel.settingRetainerPickerModel!.data!.retainers![index]);
      refreshUi();
    }
  }

  void closeTap(int index) async {
    await widget.viewModel.removeRetainerFromList(
        widget.viewModel.settingRetainerPickerModel!.data!.retainers![index]);

    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  void insertRetainer(PickerRetainer retainer) {
    widget.viewModel.insertRetainerToList(retainer);
    refreshUi();
  }

  Map<String, dynamic>? toJson() {
    widget.viewModel.toJson();
    return widget.viewModel.postData;
  }
}
