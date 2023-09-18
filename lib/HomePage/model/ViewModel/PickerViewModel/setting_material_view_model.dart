import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_material_from_json_model.dart';

import '../../ToJsonModel/PickerToJsonModel/setting_material_to_json_model.dart';

import 'package:flutter/material.dart';
import '../../DataModel/PickerDataModel/setting_material_data_copy.dart'
    as vdata;
import '../../DataModel/PickerDataModel/setting_material_data.dart' as tdata;

class SettingMaterialPickerViewModel {
  Response? response;
  SettingMaterialPickerModel? settingMaterialPickerModel;
  SettingMaterialPickerModel? modelTemp;

  var data = tdata.data;
  var datav = vdata.data;

  Future<int> refresh(String retainerId) async {
    response = null;
    settingMaterialPickerModel = null;

    //通过retainerId发起post请求
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingMaterialPickerModel = SettingMaterialPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> updateCatalog() async {
    response = null;

    var postData =
        SettingMaterialToJsonModel.toJsonModel(settingMaterialPickerModel!);

    //通过post向服务器发起http请求
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  void updateModel(
    List<TextEditingController> nameCtls,
    List<TextEditingController> hqCtls,
  ) {
    for (int i = 0; i < nameCtls.length; i++) {
      if (settingMaterialPickerModel!.data.store.items[i].itemName !=
          nameCtls[i].text) {
        settingMaterialPickerModel!.data.store.items[i].itemName =
            nameCtls[i].text;
      }

      if (settingMaterialPickerModel!.data.store.items[i].hq !=
          hqCtls[i].text) {
        settingMaterialPickerModel!.data.store.items[i].hq = hqCtls[i].text;
      }
    }
  }

  void addItem() {
    PickerItem vItem = PickerItem();
    vItem.itemName = '';
    vItem.hq = '';

    settingMaterialPickerModel!.data.store.items.add(vItem);
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
      modelTemp = SettingMaterialPickerModel.fromJson(datav);
    } else {
      //1.提示搜索失败
    }

    return response!.statusCode!;
  }

  void copyModel() {
    settingMaterialPickerModel!.data.store.items = [];
    for (int i = 0; i < modelTemp!.data.store.items.length; i++) {
      PickerItem vItem = PickerItem();
      vItem.itemName = modelTemp!.data.store.items[i].itemName;
      vItem.hq = modelTemp!.data.store.items[i].hq;

      settingMaterialPickerModel!.data.store.items.add(vItem);
    }
  }

  void initModel() {
    modelTemp = null;
    settingMaterialPickerModel = null;
  }
}
