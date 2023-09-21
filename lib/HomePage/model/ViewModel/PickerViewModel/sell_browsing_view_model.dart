import 'package:dio/dio.dart';
import '../../FromJsonModel/PickerFromJsonModel/sell_browsing_from_json_model.dart';
import '../../DataModel/PickerDataModel/sell_browsing_data.dart' as tdata;

class SellBrowsingPickerViewModel {
  Response? response;
  SellBrowsingPickerModel? sellBrowsingPickerModel;

  //test后期删除
  var data = tdata.data;

  int? year;
  int? month;
  int? days;
  int? firstDayOfWeek;
  int? date;

  Future<int> refresh(
    String retainerId, ) async {
    response = null;


    Map<String, String> postData = {};
    postData['retainerId'] = retainerId;
    postData['year'] = year.toString();
    postData['month'] = month.toString();
    postData['date'] = date.toString();

    //通过retainerId 和 date 向服务器发起查询道具数据
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == 200) {
      //模拟加载数据
      sellBrowsingPickerModel = SellBrowsingPickerModel.fromJson(data);
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  int getYear() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    return currentYear;
  }

  int getMonth() {
    DateTime now = DateTime.now();
    int currentMonth = now.month;
    return currentMonth;
  }

  int getDays(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  int getFirstDayOfWeek(int year, int month) {
    return DateTime(year, month, 1).weekday;
  }

  Future<int> timeInit() async {
    year = getYear();
    month = getMonth();
    days = getDays(year!, month!);
    firstDayOfWeek = getFirstDayOfWeek(year!, month!);
    return 200;
  }

  void setDate(int? tdate) {
    date = tdate;
  }

  void refreshCalendar() {
    days = getDays(year!, month!);
    firstDayOfWeek = getFirstDayOfWeek(year!, month!);
  }
}
