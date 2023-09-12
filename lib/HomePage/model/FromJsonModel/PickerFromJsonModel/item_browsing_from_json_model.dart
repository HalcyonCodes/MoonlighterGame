class ItemBrowsingPickerModel {
  late String code;
  late String message;
  late ItemBrowsingPickerData data;

  ItemBrowsingPickerModel();

  ItemBrowsingPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = ItemBrowsingPickerData.fromJson(json['data']);
  }
}

class ItemBrowsingPickerData {
  late Store store;
  late Shelf shelf;

  ItemBrowsingPickerData();

  ItemBrowsingPickerData.fromJson(Map<String, dynamic> json) {
    store = Store.fromJson(json['store']);
    shelf = Shelf.fromJson(json['shelf']);
  }
}

class Store {
  late String count;
  late List<StoreItem> items;

  Store();

  Store.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    items = [];
    if (json['items'] != null) {
      json['items'].forEach((item) {
        items.add(StoreItem.fromJson(item));
      });
    }
  }
}

class Shelf {
  late String count;
  late List<ShelfItem> items;

  Shelf();

  Shelf.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    items = [];
    if (json['items'] != null) {
      json['items'].forEach((item) {
        items.add(ShelfItem.fromJson(item));
      });
    }
  }
}

class ShelfItem {
  late String name;
  late String hq;
  late String price;
  late String count;

  ShelfItem();

  ShelfItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hq = json['hq'];
    price = json['price'];
    count = json['count'];
  }
}

class StoreItem {
  late String name;
  late String hq;
  late String count;

  StoreItem();

  StoreItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hq = json['hq'];
    count = json['count'];
  }
}
