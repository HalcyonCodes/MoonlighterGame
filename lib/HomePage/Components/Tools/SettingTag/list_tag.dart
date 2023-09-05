import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingTag/card_tag.dart';

import '../../../../ToolWidgets/rectangle_cliper.dart';

import '../../../model/FromJsonModel/PickerFromJsonModel/setting_tag_from_json_model.dart';
import '../../../model/FromJsonModel/ToolFromJsonModel/setting_tag_from_json_model.dart';
import '../../../model/ViewModel/ToolViewModel/setting_tag_view_model.dart';
import '../../Util/util_tools.dart';

class TagList extends StatefulWidget {
  final SettingTagToolViewModel viewModel;
  final ToolUtil toolUtil;

  const TagList({super.key, required this.viewModel, required this.toolUtil});

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  List<Widget>? listItems;
  int? cardCount = 12;

  @override
  void initState() {
    super.initState();

    //注册
    widget.toolUtil.setFuncAddViewModelTag(addToolTag);
  }

  @override
  Widget build(BuildContext context) {
    listItems = List.generate(
        widget.viewModel.settingTagToolModel!.data.tags.length, (index) {
      return TagCard(
          key: UniqueKey(),
          id: widget.viewModel.settingTagToolModel!.data.tags[index].tagId,
          name: widget.viewModel.settingTagToolModel!.data.tags[index].tagName,
          date: widget.viewModel.settingTagToolModel!.data.tags[index].tagTime,
          onTap: () {
            onRemoveTap(index);
          });
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
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ClipPath(
          clipper: RectangleClipper(),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: listItems!,
            ),
          ),
        ),
      ),
    );
  }

  void refreshUi() {
    setState(() {});
  }

  void onRemoveTap(index) {
    widget.viewModel
        .removeTag(widget.viewModel.settingTagToolModel!.data.tags[index]);
    refreshUi();
  }

  void addToolTag(PickerTag pTag) {
    Tag tag = Tag();
    tag.tagId = pTag.tagId;
    tag.tagName = pTag.tagName;
    tag.tagTime = pTag.tagTime;
    widget.viewModel.addTag(tag);
    refreshUi();
  }
}
