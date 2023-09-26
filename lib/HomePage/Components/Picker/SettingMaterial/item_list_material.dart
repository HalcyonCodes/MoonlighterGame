import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import './item_material.dart';
import '../../../Model/ViewModel/PickerViewModel/setting_material_view_model.dart';
import '../../Util/util_picker.dart';

class MaterialItemList extends StatefulWidget {
  final SettingMaterialPickerViewModel viewModel;
  final PickerUtil pickerUtil;
  const MaterialItemList(
      {super.key, required this.viewModel, required this.pickerUtil});

  @override
  State<MaterialItemList> createState() => _MaterialItemListState();
}

class _MaterialItemListState extends State<MaterialItemList> {
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
        widget.viewModel.settingMaterialPickerModel!.data.store.items.length,
        (index) {
      return MaterialItemInput(
        key: UniqueKey(),
        itemName: widget.viewModel.settingMaterialPickerModel!.data.store
            .items[index].itemName,
        itemType: widget
            .viewModel.settingMaterialPickerModel!.data.store.items[index].hq,
        delectOnTap: () {
          delectOnTap(index);
        },
        pickerUtil: widget.pickerUtil,
        viewModel: widget.viewModel,
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
    widget.viewModel.settingMaterialPickerModel!.data.store.items
        .removeAt(index);
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.pickerUtil.refreshSettingMaterialCount!(widget.pickerUtil.nameCtls!.length.toString());
    });
  }

  void addItem() {
    widget.viewModel.addItem();
    refreshUi();
  }
}
