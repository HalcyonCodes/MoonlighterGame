import 'package:flutter/material.dart';

import './title_calendar.dart';
import './card_calendar.dart';
import '../../Util/util_picker.dart';

class Calendar extends StatelessWidget {
  final PickerUtil pickerUtil;
  const Calendar({super.key, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CalendarTitle(month: '8', year: '2023'),
        SizedBox(
          height: 16,
        ),
        CalendarCard(pickerUtil: pickerUtil,),
      ],
    );
  }
}
