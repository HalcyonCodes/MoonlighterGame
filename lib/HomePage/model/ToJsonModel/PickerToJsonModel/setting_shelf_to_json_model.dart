import '../../FromJsonModel/PickerFromJsonModel/setting_shelf_from_json_model.dart';

class SettingShelfToJsonModel {
  Map<String, dynamic> shelf = {};

  SettingShelfToJsonModel();

  SettingShelfToJsonModel.toJsonModel(SettingShelfPickerModel vModel) {
    shelf['count'] = vModel.data.shelf.count;
    shelf['items'] = [];

    for (var i = 0; i < vModel.data.shelf.items.length; i++) {
      shelf['items'].add(ItemToJsonModel.toJsonModel(
        vModel.data.shelf.items[i]));
    }
  }
}

class ItemToJsonModel {
  Map<String, dynamic> item = {};

  ItemToJsonModel();

  ItemToJsonModel.toJsonModel(PickerItem vItem) {
    item['itemName'] = vItem.itemName;
    item['hq'] = vItem.hq;
    item['itemCount'] = vItem.itemCount;
  }
}
