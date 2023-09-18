import '../../FromJsonModel/PickerFromJsonModel/setting_material_from_json_model.dart';

class SettingMaterialToJsonModel {
  Map<String, dynamic> store = {};

  SettingMaterialToJsonModel();

  SettingMaterialToJsonModel.toJsonModel(SettingMaterialPickerModel vModel) {
    store['count'] = vModel.data.store.count;
    store['items'] = [];

    for (var i = 0; i < vModel.data.store.items.length; i++) {
      store['items'].add(ItemToJsonModel.toJsonModel(
        vModel.data.store.items[i]));
    }
  }
}

class ItemToJsonModel {
  Map<String, dynamic> item = {};

  ItemToJsonModel();

  ItemToJsonModel.toJsonModel(PickerItem vItem) {
    item['itemName'] = vItem.itemName;
    item['hq'] = vItem.hq;

  }
}
