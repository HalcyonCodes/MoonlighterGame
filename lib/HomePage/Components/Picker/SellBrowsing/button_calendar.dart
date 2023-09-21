import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import '../../Util/util_picker.dart';

class CalendarButton extends StatefulWidget {
  final String date;
  final Function()? onTap;
  final PickerUtil pickerUtil;
  const CalendarButton(
      {super.key,
      required this.date,
      required this.onTap,
      required this.pickerUtil});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  bool? isSelect;
  String? date;

  @override
  void initState() {
    super.initState();
    isSelect = false;
    date = widget.date;
    widget.pickerUtil.addListChangeSellBrowsingCalendarSelect(setSelect);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: date == ' ' ? () {} : widget.onTap,
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: isSelect! ? KColor.primaryColor : KColor.containerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                date!,
                style: isSelect == true
                    ? KFont.calendarDateSelectedStyle
                    : KFont.calendarDateStyle,
              ),
            )),
      ),
    );
  }

  void setSelect(bool select) {
    widget.date == ' '
        ? () {}
        : (() {
            isSelect = select;
            refreshUi();
          })();
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    widget.pickerUtil.removeFuncListChangeSellBrowsingCalendarSelect(setSelect);
  }
}
