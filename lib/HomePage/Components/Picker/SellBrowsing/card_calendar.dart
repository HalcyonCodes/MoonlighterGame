import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import './button_calendar.dart';
import '../../Util/util_picker.dart';

class CalendarCard extends StatefulWidget {
  final PickerUtil pickerUtil;
  const CalendarCard({super.key, required this.pickerUtil});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  List<Widget>? buttons;

  @override
  void initState() {
    super.initState();

    buttons = [];

    widget.pickerUtil.setFuncListChangeSellBrowsingCalendarSelect([]);
  }

  @override
  Widget build(BuildContext context) {
    buttons = List.generate(35, (index) {
      return CalendarButton(
        date: index.toString(),
        pickerUtil: widget.pickerUtil,
        onTap: () {
          onTap(index);
        },
      );
    });
    return Container(
      decoration: KDecoration.cardDecoration,
      height: 381,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.mon,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.tue,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.wed,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.thu,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.fri,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.sat,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 24,
                ),
                Container(
                    width: 56,
                    height: 17,
                    alignment: Alignment.center,
                    child: Text(
                      KString.sun,
                      style: KFont.cardProfileStyle,
                    )),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(spacing: 24, runSpacing: 12, children: buttons!)
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    for (int i = 0;
        i <= widget.pickerUtil.listChangeSellBrowsingCalendarSelect!.length - 1;
        i++) {
      widget.pickerUtil.listChangeSellBrowsingCalendarSelect![i](false);
    }
    widget.pickerUtil.listChangeSellBrowsingCalendarSelect![index](true);
  }
}
