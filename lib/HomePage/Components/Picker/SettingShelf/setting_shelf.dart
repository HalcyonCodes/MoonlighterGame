import 'package:flutter/material.dart';
import './retainer_search.dart';
import './shelf_retainer.dart';
import '../../Util/util_picker.dart';

class PickerSettingShelf extends StatelessWidget {
  final PickerUtil pickerUtil;
  const PickerSettingShelf({super.key, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RetainerSearch(),
        SizedBox(
          height: 32,
        ),
        RetainerShelf(
          pickerUtil: pickerUtil,
        ),
      ],
    );
  }
}
