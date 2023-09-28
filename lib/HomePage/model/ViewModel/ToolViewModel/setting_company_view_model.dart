import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/setting_company_from_json_model.dart';
import '../../ToJsonModel/ToolToJsonModel/setting_company_to_json_model.dart';

//test
import '../../DataModel/ToolDataModel/setting_company_data.dart' as tdata;

class SettingCompanyToolViewModel {
  Response? response;
  SettingCompanyToolModel? settingCompanyToolModel;

  //test
  var data = tdata.data;

  //获取所有retainer数据
  Future<int> refresh(String accountId) async {
    //test
    print(accountId);

    response = null;
    settingCompanyToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      settingCompanyToolModel = SettingCompanyToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //提交更新
  Future<int> upDataCompany() async {
    response = null;

    var postData =
        SettingCompanyToJsonModel.toJsonModel(settingCompanyToolModel!);

    //发起post请求提交修改
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  //移除公司
  void removeCompany(Role role) {
    role.company = null;
  }

  //添加公司
  void addCompany(Role role, Company company) {
    role.company = company;
  }

  
}
