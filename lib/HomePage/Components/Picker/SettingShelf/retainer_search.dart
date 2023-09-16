import 'package:flutter/material.dart';
import './retainer_search_bar.dart';
import './result_search.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';

class RetainerSearch extends StatefulWidget {
  final SettingShelfPickerViewModel viewModel;
  const RetainerSearch({super.key, required this.viewModel});

  @override
  State<RetainerSearch> createState() => _RetainerSearchState();
}

class _RetainerSearchState extends State<RetainerSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            widget.viewModel.modelTemp!.data.shelf.retainerId != ''
                ? SearchResult(
                    id: widget.viewModel.modelTemp!.data.shelf.retainerId,
                    category:
                        widget.viewModel.modelTemp!.data.shelf.retainerChannel,
                    name: widget.viewModel.modelTemp!.data.shelf.retainerName,
                    profile:
                        widget.viewModel.modelTemp!.data.shelf.retainerDesc,
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
    refreshUi();
  }
}
