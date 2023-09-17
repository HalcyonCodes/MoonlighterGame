import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_shelf_from_json_model.dart';
import '../../DataModel/PickerDataModel/setting_shelf_data.dart' as tdata;
import '../../ToJsonModel/PickerToJsonModel/setting_shelf_to_json_model.dart';

import 'package:flutter/material.dart';
import '../../DataModel/PickerDataModel/setting_shelf_data_copy.dart' as vdata;

class SettingShelfPickerViewModel {
  Response? response;
  SettingShelfPickerModel? settingShelfPickerModel;
  SettingShelfPickerModel? modelTemp;

  var data = tdata.data;
  var datav = vdata.data;

  Future<int> refresh(String retainerId) async {
    response = null;
    settingShelfPickerModel = null;

    //通过retainerId发起post请求
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingShelfPickerModel = SettingShelfPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> updateCatalog() async {
    response = null;

    var postData =
        SettingShelfToJsonModel.toJsonModel(settingShelfPickerModel!);

    //通过post向服务器发起http请求
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  void updateModel(
      List<TextEditingController> nameCtls,
      List<TextEditingController> hqCtls,
      List<TextEditingController> countCtls) {
    for (int i = 0; i < nameCtls.length; i++) {
      if (settingShelfPickerModel!.data.shelf.items[i].itemName !=
          nameCtls[i].text) {
        settingShelfPickerModel!.data.shelf.items[i].itemName =
            nameCtls[i].text;
      }

      if (settingShelfPickerModel!.data.shelf.items[i].hq != hqCtls[i].text) {
        settingShelfPickerModel!.data.shelf.items[i].hq = hqCtls[i].text;
      }

      if (settingShelfPickerModel!.data.shelf.items[i].itemCount !=
          countCtls[i].text) {
        settingShelfPickerModel!.data.shelf.items[i].itemCount =
            countCtls[i].text;
      }
    }
  }

  void addItem() {
    PickerItem vItem = PickerItem();
    vItem.itemName = '';
    vItem.hq = '';
    vItem.itemCount = '';
    settingShelfPickerModel!.data.shelf.items.add(vItem);
  }

  Future<int> search(String text, String type) async {
    response = null;
    modelTemp = null;

    Map<String, dynamic> postData = {};

    postData['text'] = text;
    postData['type'] = type;

    //通过post向服务器发起http请求
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //加载
      modelTemp = SettingShelfPickerModel.fromJson(datav);
    } else {
      //1.提示搜索失败
    }

    return response!.statusCode!;
  }

  void copyModel() {
    settingShelfPickerModel!.data.shelf.items = [];
    for (int i = 0; i < modelTemp!.data.shelf.items.length; i++) {
      PickerItem vItem = PickerItem();
      vItem.itemName = modelTemp!.data.shelf.items[i].itemName;
      vItem.hq = modelTemp!.data.shelf.items[i].hq;
      vItem.itemCount = modelTemp!.data.shelf.items[i].itemCount;
      settingShelfPickerModel!.data.shelf.items.add(vItem);
    }
  }

  void initModel() {
    modelTemp = null;
    settingShelfPickerModel = null;
  }
}
