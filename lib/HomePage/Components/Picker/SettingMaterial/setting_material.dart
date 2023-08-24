import 'package:flutter/material.dart';
import './retainer_search.dart';
import './retainer_material.dart';
import '../../Util/util_picker.dart';

class PickerSettingMaterial extends StatelessWidget {
  final PickerUtil pickerUtil;
  const PickerSettingMaterial({super.key, required this.pickerUtil});

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
        RetainerMaterial(
          pickerUtil: pickerUtil,
        ),
      ],
    );
  }
}
