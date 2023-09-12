import 'dart:io';

import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/item_browsing_from_json_model.dart';

//test
import '../../DataModel/ToolDataModel/item_browsing_data.dart' as tdata;

class ItemBrowsingToolViewModel {
  Response? response;
  ItemBrowsingToolModel? itemBrowsingToolModel;

  var data = tdata.data;

  //获取所有retainer数据
   Future<int> refresh(String accountId) async {
    //test
    print(accountId);
    
    response = null;
    itemBrowsingToolModel= null;

    //发起http请求获得当前account数据
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      itemBrowsingToolModel = ItemBrowsingToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
