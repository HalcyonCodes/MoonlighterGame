import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/setting_company_from_json_model.dart';


import '../../DataModel/PickerDataModel/setting_company_data.dart' as tdata;


class SettingCompanyPickerViewModel{

  
  Response? response;
  SettingCompanyPickerModel? settingCompanyPickerModel;

  var data = tdata.data;



  Future<int> refresh() async {
    response = null;
    settingCompanyPickerModel = null;

    //通过发起请求获取全部公司
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingCompanyPickerModel = SettingCompanyPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }


}