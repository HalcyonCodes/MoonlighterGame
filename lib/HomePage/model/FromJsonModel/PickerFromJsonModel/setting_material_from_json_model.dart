class SettingMaterialPickerModel {
  late String code;
  late String message;
  late SettingMaterialPickerData data;

  SettingMaterialPickerModel();

  SettingMaterialPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = SettingMaterialPickerData.fromJson(json['data']);
    }
  }
}

class SettingMaterialPickerData {
  late PickerStore store;

  SettingMaterialPickerData();

  SettingMaterialPickerData.fromJson(Map<String, dynamic> json) {
    if (json['store'] != null) {
      store = PickerStore.fromJson(json['store']);
    }
  }
}

class PickerStore {
  late String count;
  late String retainerId;
  late String retainerName;
  late String retainerChannel;
  late String retainerDesc;

  late List<PickerItem> items;

  PickerStore();

  PickerStore.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    retainerId = json['retainerId'];
    retainerChannel = json['retainerChannel'];
    retainerName = json['retainerName'];
    retainerDesc = json['retainerDesc'];

    items = [];

    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(PickerItem.fromJson(v));
      });
    }
  }
}

class PickerItem {
  late String itemName;
  late String hq;

  PickerItem();

  PickerItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    hq = json['hq'];
  }
}
