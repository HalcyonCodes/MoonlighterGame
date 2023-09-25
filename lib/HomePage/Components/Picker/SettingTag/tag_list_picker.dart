import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Picker/SettingTag/tag_card_picker.dart';
import '../../.././../ToolWidgets/rectangle_cliper.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_tag_view_model.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_picker.dart';

class PickerTagList extends StatefulWidget {
  final SettingTagPickerViewModel? viewModel;
  final PickerUtil? pickerUtil;
  final ToolUtil? toolUtil;

  const PickerTagList(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State<PickerTagList> createState() => _PickerTagListState();
}

class _PickerTagListState extends State<PickerTagList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();

    widget.pickerUtil!.setFuncGetPickerTagListToJsonModel(getToJson);
    //注册
    widget.pickerUtil!.setFuncRefreshTagList(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel!.settingTagPickerModel!.data.tags.length, (index) {
      return PickerTagCard(
          key: UniqueKey(),
          id: widget.viewModel!.settingTagPickerModel!.data.tags[index].tagId,
          name:
              widget.viewModel!.settingTagPickerModel!.data.tags[index].tagName,
          date:
              widget.viewModel!.settingTagPickerModel!.data.tags[index].tagTime,
          onDelectTap: () {
            onRemoveTap(index);
          },
          onAddTap: () {
            onAddTap(index);
          });
    });
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24 - 46 - 16 - 75 - 32,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView(clipBehavior: Clip.none, children: items!)),
      ),
    );
  }

  void onRemoveTap(int index) async {
    widget.viewModel!.removeTag(
        widget.viewModel!.settingTagPickerModel!.data.tags[index].tagId);
    widget.pickerUtil!.refreshTagList!();
  }

  void onAddTap(int index) {
    widget.toolUtil!.addViewModelTag!(
        widget.viewModel!.settingTagPickerModel!.data.tags[index]);
  }

  Map<String, dynamic> getToJson() {
    return widget.viewModel!.toJson();
  }

  void refreshUi() {
    setState(() {});
  }
}
