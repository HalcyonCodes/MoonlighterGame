import 'package:flutter/material.dart';
import './retainer_search_bar.dart';
import './result_search.dart';
import '../../Util/util_picker.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';

class RetainerSearch extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
  final SettingMaterialPickerViewModel viewModel;
  const RetainerSearch({super.key, required this.toolUtil, required this.pickerUtil, required this.viewModel});

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
                          id: widget.viewModel.modelTemp!.data.store.retainerId,
                          category: widget
                              .viewModel.modelTemp!.data.store.retainerChannel,
                          name: widget
                              .viewModel.modelTemp!.data.store.retainerName,
                          profile: widget
                              .viewModel.modelTemp!.data.store.retainerDesc,
                          onLongTap: () {
                            copyItems();
                          })
                      : const SizedBox()
                ]),
          );
  }

  void refreshUi() {
    setState(() {});
  }

  void copyItems() {
    widget.viewModel.copyModel();
    widget.pickerUtil.refreshShelfItemList!();
  }
}
