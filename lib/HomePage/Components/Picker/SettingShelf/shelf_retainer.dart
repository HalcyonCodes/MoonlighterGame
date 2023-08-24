

import 'package:flutter/material.dart';
import './shelf_titile.dart';
import '../../Util/util_picker.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './item_list_shelf.dart';

class RetainerShelf extends StatefulWidget {
  final PickerUtil pickerUtil;
  const RetainerShelf({super.key, required this.pickerUtil});

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
        ShelfTitle(itemCount: '5', pickerUtil: widget.pickerUtil,),
        const SizedBox(height: 16,),
        SizedBox(height: MediaQuery.of(context).size.height - 24 - 24 - 161 - 46 - 16 - 32 - 46 - 16 - 16,
        child: ClipPath(
          clipper: RectangleClipper(),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: ShelfItemList(),
            ),
          ),
        ),
        
        )


      ],
    );
  }
}