import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import './item_input_shelf.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_shelf_view_model.dart';
import '../../Util/util_picker.dart';

class ShelfItemList extends StatefulWidget {
  final SettingShelfPickerViewModel? viewModel;
  final PickerUtil pickerUtil;

  const ShelfItemList(
      {super.key, required this.viewModel, required this.pickerUtil});

  @override
  State<ShelfItemList> createState() => _ShelfItemListState();
}

class _ShelfItemListState extends State<ShelfItemList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];

    //初始化
    widget.pickerUtil.setNameCtls([]);
    widget.pickerUtil.setCountCtls([]);
    widget.pickerUtil.setTypeCtls([]);
    widget.pickerUtil.setFuncRefreshShelfItemList(refreshUi);
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel!.settingShelfPickerModel!.data.shelf.items.length,
        (index) {
      return ShelfItemInput(
        key: UniqueKey(),
        itemCount: widget.viewModel!.settingShelfPickerModel!.data.shelf
            .items[index].itemCount,
        itemName: widget.viewModel!.settingShelfPickerModel!.data.shelf
            .items[index].itemName,
        itemType: widget
            .viewModel!.settingShelfPickerModel!.data.shelf.items[index].hq,
        pickerUtil: widget.pickerUtil,
        viewModel: widget.viewModel!,
        delectOnTap: () {
          delectOnTap(index);
        },
      );
    });

    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  KString.itemName,
                  style: KFont.cardProfileStyle,
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: 21,
                    child: Text(
                      KString.itemStyle,
                      style: KFont.cardProfileStyle,
                    )),
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
                const SizedBox(
                  width: 70 - 24,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
            SizedBox(
              height: 22,
              width: 22,
              child: InkWell(
                onTap: () {
                  addItem();
                },
                child: SvgPicture.asset('Svg/plus_card.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }

  void delectOnTap(int index) {
    widget.viewModel!.settingShelfPickerModel!.data.shelf.items.removeAt(index);
    refreshUi();
  }

  void refreshUi() {
    
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.pickerUtil.refreshSettingShelfCount!(widget.pickerUtil.nameCtls!.length.toString());
    });
    
    
  }

  void addItem() {
    widget.viewModel!.addItem();
    refreshUi();
  }
}
