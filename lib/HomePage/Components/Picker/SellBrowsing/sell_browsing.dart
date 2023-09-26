import 'package:flutter/material.dart';
import './future_calendar.dart';
import '../../Util/util_picker.dart';
import './future_item_list_sell.dart';
import '../../../Model/ViewModel/PickerViewModel/sell_browsing_view_model.dart';
import '../../Util/util_tools.dart';

class PickerSellBrowsing extends StatelessWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SellBrowsingPickerViewModel viewModel = SellBrowsingPickerViewModel();

  PickerSellBrowsing({super.key, required this.pickerUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarFuture(
          pickerUtil: pickerUtil,
          viewModel: viewModel,
          toolUtil: toolUtil,
        ),
        const SizedBox(
          height: 32,
        ),
        SellItemListFuture(
          viewModel: viewModel,
          pickerUtil: pickerUtil,
          toolUtil: toolUtil,
        ),
      ],
    );
  }
}
