

import 'package:flutter/material.dart';
import './shelf_title.dart';
import './store_title.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './item_list.dart';
import './item_list_sell.dart';
import '../../../Model/ViewModel/PickerViewModel/item_browsing_view_model.dart';

class PickerItemBrowsing extends StatelessWidget {
  final ItemBrowsingPickerViewModel viewModel;
  const PickerItemBrowsing({super.key, required this.viewModel});

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
                ShelfTitle(itemCount: viewModel.itemBrowsingPickerModel!.data.shelf.count, ),
                const SizedBox(height: 16,),
                SellItemList(viewModel: viewModel,),
                const SizedBox(height: 32,),
                StoreTitle(itemCount: viewModel.itemBrowsingPickerModel!.data.store.count,),
                const SizedBox(height: 16,),
                ItemList(viewModel: viewModel,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}