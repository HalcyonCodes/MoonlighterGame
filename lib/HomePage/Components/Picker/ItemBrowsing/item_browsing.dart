

import 'package:flutter/material.dart';
import './shelf_title.dart';
import './store_title.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './item_list.dart';

class PickerItemBrowsing extends StatelessWidget {
  const PickerItemBrowsing({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShelfTitle(itemCount: '12', ),
                SizedBox(height: 16,),
                ItemList(),
                SizedBox(height: 32,),
                StoreTitle(itemCount: '12'),
                SizedBox(height: 16,),
                ItemList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}