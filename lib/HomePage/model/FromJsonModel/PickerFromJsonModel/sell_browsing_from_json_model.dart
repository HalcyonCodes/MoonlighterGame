class SellBrowsingPickerModel {
  late String code;
  late String message;
  late SellBrowsingPickerData data;

  SellBrowsingPickerModel();

  SellBrowsingPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = SellBrowsingPickerData.fromJson(json['data']);
    }
    
  }
}

class SellBrowsingPickerData {
  late String total;
  late List<Item> items;

  SellBrowsingPickerData();

  SellBrowsingPickerData.fromJson(Map<String, dynamic> json) {
    items = [];
    total = json['total'];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(Item.fromJson(v));
      });
    }
  }
}

class Item {
  late String itemName;
  late String hq;
  late String itemCount;
  late String itemPrice;

  Item();

  Item.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    hq = json['hq'];
    itemCount = json['itemCount'];
    itemPrice = json['itemPrice'];
  }
}
