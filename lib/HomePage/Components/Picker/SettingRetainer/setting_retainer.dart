import 'package:flutter/material.dart';
import './edit_retainer.dart';
import './retainer_list_picker.dart';

class PickerSettingRetainer extends StatelessWidget {
  const PickerSettingRetainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          EditRetainer(),
          const SizedBox(
            height: 32,
          ),
          PickerRetainerList()
        ]);
  }
}
