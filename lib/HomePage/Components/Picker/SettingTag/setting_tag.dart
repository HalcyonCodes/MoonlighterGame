import 'package:flutter/material.dart';
import './add_tag.dart';
import './tag_list_picker.dart';


class PickerSettingTag extends StatelessWidget {
  const PickerSettingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTag(),
          SizedBox(
            height: 32,
          ),
          PickerTagList()
        ],
      ),
    );
  }
}
