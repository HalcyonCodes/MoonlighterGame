import 'dart:io';

import 'package:dio/dio.dart';

import '../../FromJsonModel/ToolFromJsonModel/edit_account_from_json_model.dart';

import '../../DataModel/ToolDataModel/edit_account_data.dart' as tdata;

class EditAccountToolViewModel {
  Response? response;
  EditAccountToolModel? editAccountToolModel;

  EditAccountToolViewModel();

  //向服务器提交修改请求
  Future<int> editAccount(String accountId, String accountName) async {
    response = null;
    //response = await Dio().post("/account/create",data: {"accountId":accountId,"accountName":accountName});
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }

  //获取account数据
  Future<int> refresh(String accountId) async {

    //test
    print(accountId);

    response = null;
    editAccountToolModel = null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var data = tdata.data;
      editAccountToolModel = EditAccountToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }


  
}
