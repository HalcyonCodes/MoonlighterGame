import 'package:flutter/material.dart';
import '../../../../Config/index.dart';
import './item.dart';
import '../../../Model/ViewModel/PickerViewModel/item_browsing_view_model.dart';

class ItemList extends StatefulWidget {
  final ItemBrowsingPickerViewModel viewModel;
  const ItemList({super.key, required this.viewModel});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items =  List.generate(widget.viewModel.itemBrowsingPickerModel!.data.store.items.length, (index) {
      return Item(
        isHq: widget.viewModel.itemBrowsingPickerModel!.data.store.items[index].hq, 
        itemName: widget.viewModel.itemBrowsingPickerModel!.data.store.items[index].name, 
        itemCount: widget.viewModel.itemBrowsingPickerModel!.data.store.items[index].count);
    });
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Text(
                    KString.itemName,
                    style: KFont.cardProfileStyle,
                  )),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 21,
                    child: Text(
                      KString.itemStyle,
                      style: KFont.cardProfileStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                    width: 34,
                    child: Text(
                      KString.itemCount,
                      style: KFont.cardProfileStyle,
                    ),
                  ),
                ]),
            const SizedBox(
              height: 4,
            ),
            Column(
              children: items!,
            )
          ],
        ),
      ),
    );
  }
}
