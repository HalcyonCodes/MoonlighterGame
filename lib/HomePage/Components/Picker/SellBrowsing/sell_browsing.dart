import 'package:flutter/material.dart';
import './calendar.dart';
import '../../Util/util_picker.dart';
import './item_list_sell.dart';

class PickerSellBrowsing extends StatelessWidget {
  final PickerUtil pickerUtil;

  const PickerSellBrowsing({super.key, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Calendar(pickerUtil: pickerUtil,),
        const SizedBox(height: 32,),
        SellItemList(total: '120000'),
        ],
    );
  }
}
