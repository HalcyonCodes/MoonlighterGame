import 'package:dio/dio.dart';
import '../../DataModel/PickerDataModel/binding_artisan_data.dart' as tdata;
import '../../FromJsonModel/PickerFromJsonModel/binding_artisan_from_json_model.dart';

class BindingArtisanPickerViewModel {
  Response? response;
  BindingArtisanPickerModel? bindingArtisanPickerModel;

  //test后期删除
  var data = tdata.data;

  Future<int> refresh() async {
    response = null;
  
    //向服务器发起查询道具数据
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == 200) {
      //模拟加载数据
      bindingArtisanPickerModel = BindingArtisanPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
