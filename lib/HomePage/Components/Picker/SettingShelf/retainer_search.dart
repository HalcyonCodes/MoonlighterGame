import 'package:flutter/material.dart';
import '../../Util/util_tools.dart';
import './retainer_search_bar.dart';
import './result_search.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';
import '../../Util/util_picker.dart';

class RetainerSearch extends StatefulWidget {
  final SettingShelfPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  const RetainerSearch(
      {super.key,
      required this.viewModel,
      required this.pickerUtil,
      required this.toolUtil});

  @override
  State<RetainerSearch> createState() => _RetainerSearchState();
}

class _RetainerSearchState extends State<RetainerSearch> {
  @override
  void initState() {
    super.initState();
    widget.pickerUtil.setFuncRefreshRetainerSearch(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return widget.toolUtil.currentRetainerId == null
        ? const SizedBox()
        : SizedBox(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RetainerSearchBar(
                    onTap: refreshUi,
                    viewModel: widget.viewModel,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  widget.viewModel.modelTemp != null
                      ? SearchResult(
                          id: widget.viewModel.modelTemp!.data.shelf.retainerId,
                          category: widget
                              .viewModel.modelTemp!.data.shelf.retainerChannel,
                          name: widget
                              .viewModel.modelTemp!.data.shelf.retainerName,
                          profile: widget
                              .viewModel.modelTemp!.data.shelf.retainerDesc,
                          onLongTap: () {
                            copyItems();
                          })
                      : const SizedBox(height: 161,)
                ]),
          );
  }

  void refreshUi() {
    setState(() {});
  }

  void copyItems() {
    widget.viewModel.copyModel();
    widget.pickerUtil.refreshShelfItemList!();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.pickerUtil.refreshSettingShelfCount!(widget.pickerUtil.nameCtls!.length.toString());
    });
  }
}
