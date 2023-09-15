import 'package:dio/dio.dart';
import '../../FromJsonModel/ToolFromJsonModel/binding_artisan_from_json_model.dart';
import '../../DataModel/ToolDataModel/binding_artisan_data.dart' as tdata;
import '../../ToJsonModel/ToolToJsonModel/binding_artisan_to_json_model.dart';

class BindingArtisanToolViewModel {
  Response? response;
  BindingArtisanToolModel? bindingArtisanToolModel = BindingArtisanToolModel();

  BindingArtisanToolViewModel();

  //test后期删除
  var data = tdata.data;

  Future<int> refresh(String retainerId) async {
    response = null;

    //通过retainerId向服务器发起查询道具数据
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == 200) {
      //模拟加载数据
      bindingArtisanToolModel = BindingArtisanToolModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  void insertArtisan(Retainer retainer, Artisan artisan) {
    retainer.artisan = artisan;
  }

  void removeArtisan(Retainer retainer) {
    retainer.artisan.artisanChannel = '';
    retainer.artisan.artisanName = '';
    retainer.artisan.artisanId = '';
    retainer.artisan.artisanDesc = '';
  }

  //当id为''时表示没有项目
  Future<int> updateArtisan() async {
    response = null;

    var postData =
        BindingArtisanToJsonModel.toJsonModel(bindingArtisanToolModel!);

    //发起post请求提交修改
    response = await Dio().get('http://localhost:4040/');

    return response!.statusCode!;
  }
}
