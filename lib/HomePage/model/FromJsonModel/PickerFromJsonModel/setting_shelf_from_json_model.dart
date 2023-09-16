class SettingShelfPickerModel {
  late String code;
  late String message;
  late SettingShelfPickerData data;

  SettingShelfPickerModel();

  SettingShelfPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = SettingShelfPickerData.fromJson(json['data']);
    }
  }
}

class SettingShelfPickerData {
  late PickerShelf shelf;

  SettingShelfPickerData();

  SettingShelfPickerData.fromJson(Map<String, dynamic> json) {
    if (json['shelf'] != null) {
      shelf = PickerShelf.fromJson(json['shelf']);
    }
  }
}

class PickerShelf {
  late String count;
  late String retainerId;
  late String retainerName;
  late String retainerChannel;
  late String retainerDesc;


  late List<PickerItem> items;

  PickerShelf();

  PickerShelf.fromJson(Map<String, dynamic> json) {
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
  late String itemCount;

  PickerItem();

  PickerItem.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    hq = json['hq'];
    itemCount = json['itemCount'];
  }
}
