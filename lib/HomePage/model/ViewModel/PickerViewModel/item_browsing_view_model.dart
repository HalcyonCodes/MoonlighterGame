import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/item_browsing_from_json_model.dart';
import '../../../Model/DataModel/PickerDataModel/item_browsing_data.dart'
    as tdata;

class ItemBrowsingPickerViewModel {
  Response? response;
  ItemBrowsingPickerModel? itemBrowsingPickerModel;

  //test后期删除
  var data = tdata.data;

  Future<int> refresh(String retainerId) async {
    response = null;


    //通过retainerId向服务器发起查询道具数据
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == 200) {
      //模拟加载数据
      itemBrowsingPickerModel = ItemBrowsingPickerModel.fromJson(data);
      return response!.statusCode!;
    }else{
      return response!.statusCode!;
    }
  }
}
