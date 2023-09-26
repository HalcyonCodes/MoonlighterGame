import 'package:flutter/material.dart';
import './material_titile.dart';
import '../../Util/util_picker.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './item_list_material.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';

class RetainerMaterial extends StatefulWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SettingMaterialPickerViewModel viewModel;
  const RetainerMaterial({super.key, required this.pickerUtil, required this.toolUtil, required this.viewModel});

  @override
  State<RetainerMaterial> createState() => _RetainerMaterialState();
}

class _RetainerMaterialState extends State<RetainerMaterial> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialTitle(
          itemCount: widget.viewModel.settingMaterialPickerModel!.data.store.count,
          pickerUtil: widget.pickerUtil,
          viewModel: widget.viewModel,
          toolUtil: widget.toolUtil,
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height -
              24 -
              24 -
              161 -
              46 -
              16 -
              32 -
              46 -
              16,
          child: ClipPath(
            clipper: RectangleClipper(),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: MaterialItemList(viewModel: widget.viewModel, pickerUtil: widget.pickerUtil,),
              ),
            ),
          ),
        )
      ],
    );
  }
}
