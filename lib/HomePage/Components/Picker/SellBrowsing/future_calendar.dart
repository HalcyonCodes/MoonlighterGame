import 'package:flutter/material.dart';
import './calendar.dart';
import '../../../Model/ViewModel/PickerViewModel/sell_browsing_view_model.dart';
import '../../Util/util_picker.dart';

class CalendarFuture extends StatefulWidget {
  final SellBrowsingPickerViewModel viewModel;
  final PickerUtil pickerUtil;

  const CalendarFuture(
      {super.key, required this.viewModel, required this.pickerUtil});

  @override
  State<CalendarFuture> createState() => _CalendarFutureState();
}

class _CalendarFutureState extends State<CalendarFuture> {
  @override
  void initState() {
    super.initState();
    widget.pickerUtil.setFuncRefreshCalendarFuture(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.timeInit(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Container();
            case ConnectionState.active:
              return Container();
            case ConnectionState.done:
              return Calendar(
                viewModel: widget.viewModel,
                pickerUtil: widget.pickerUtil,
              );
          }
        });
  }

  void refreshUi() {
    setState(() {
    });
  }
}
