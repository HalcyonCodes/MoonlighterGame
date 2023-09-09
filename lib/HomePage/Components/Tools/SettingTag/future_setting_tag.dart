import 'package:flutter/material.dart';
import './setting_tag.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/setting_tag_view_model.dart';
import '../../Util/util_picker.dart';

class SettingTagFuture extends StatelessWidget {
  final SettingTagToolViewModel viewModel = SettingTagToolViewModel();
  final ToolUtil? toolUtil;
  final PickerUtil? pickerUtil;

  SettingTagFuture(
      {super.key, required this.toolUtil, required this.pickerUtil});

  @override
  Widget build(BuildContext context) {
    return toolUtil!.listSelectId != null
        ? FutureBuilder(
            future: viewModel.refresh(toolUtil!.listSelectId!),
            builder: (context, snapShot) {
              switch (snapShot.connectionState) {
                case ConnectionState.none:
                  return Text('none');

                case ConnectionState.active:
                  return Text('active');

                case ConnectionState.waiting:
                  return Text('waiting');

                case ConnectionState.done:
                    return SettingTag(
                      toolUtil: toolUtil!, viewModel: viewModel, pickerUtil: pickerUtil!,
                    );
                  
              }
            })
        : const SizedBox();
  }
}
