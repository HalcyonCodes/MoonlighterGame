import 'package:flutter/material.dart';

import './title_calendar.dart';
import './card_calendar.dart';
import '../../Util/util_picker.dart';
import '../../../Model/ViewModel/PickerViewModel/sell_browsing_view_model.dart';
import '../../Util/util_tools.dart';

class Calendar extends StatefulWidget {
  final SellBrowsingPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  const Calendar(
      {super.key, required this.pickerUtil, required this.viewModel, required this.toolUtil});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    widget.viewModel.refreshCalendar();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarTitle(
            key: UniqueKey(),
            onLeftTap: onleftTap,
            onRightTap: onRightTap,
            month: widget.viewModel.month.toString(),
            year: widget.viewModel.year.toString()),
        const SizedBox(
          height: 16,
        ),
        CalendarCard(
          pickerUtil: widget.pickerUtil,
          viewModel: widget.viewModel,
          toolUtil: widget.toolUtil,
        ),
      ],
    );
  }

  void onleftTap() {
    widget.viewModel.month = widget.viewModel.month! - 1;
    if (widget.viewModel.month == 0) {
      widget.viewModel.year = widget.viewModel.year! - 1;
      widget.viewModel.month = 12;
    }

    //初始化
    widget.pickerUtil.setCalendarDate!(null);
    widget.pickerUtil.refreshCalendarButton!();
    widget.pickerUtil.refreshSellItemListFuture!();

    //widget.pickerUtil.refreshCalendarFuture!();
    refreshUi();
  }

  void onRightTap() {
    widget.viewModel.month = widget.viewModel.month! + 1;
    if (widget.viewModel.month == 13) {
      widget.viewModel.year = widget.viewModel.year! + 1;
      widget.viewModel.month = 1;
    }
    //初始化
    widget.pickerUtil.setCalendarDate!(null);
    widget.pickerUtil.refreshCalendarButton!();
    widget.pickerUtil.refreshSellItemListFuture!();

    //widget.pickerUtil.refreshCalendarFuture!();
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }
}
