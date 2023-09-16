

import 'package:flutter/material.dart';
import './shelf_titile.dart';
import '../../Util/util_picker.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';
import './item_list_shelf.dart';
import '../../Util/util_tools.dart';

class RetainerShelf extends StatefulWidget {
  final PickerUtil pickerUtil;
  final ToolUtil toolUtil;
  final SettingShelfPickerViewModel viewModel;
  const RetainerShelf({super.key, required this.pickerUtil, required this.toolUtil, required this.viewModel});

  @override
  State<RetainerShelf> createState() => _RetainerShelfState();
}

class _RetainerShelfState extends State<RetainerShelf> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShelfTitle(
          itemCount: widget.viewModel.settingShelfPickerModel!.data.shelf.count, 
          pickerUtil: widget.pickerUtil,
          viewModel: widget.viewModel, toolUtil: widget.toolUtil,
          ),
        const SizedBox(height: 16,),
        SizedBox(height: MediaQuery.of(context).size.height - 24 - 24 - 161 - 46 - 16 - 32 - 46 - 16 - 16,
        child: ClipPath(
          clipper: RectangleClipper(),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: ShelfItemList(
                pickerUtil: widget.pickerUtil,
                viewModel: widget.viewModel,),
            ),
          ),
        ),
        
        )


      ],
    );
  }
}