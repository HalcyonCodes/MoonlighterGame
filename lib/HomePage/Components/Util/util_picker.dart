

class PickerUtil{
  //Picker中改变当前选项
  Function? _changePickerCurrentIndex;
  Function? get changePickerCurrentIndex => _changePickerCurrentIndex;
  void setFuncChangePickerCurrentIndex(Function? func){
    _changePickerCurrentIndex = func;
  }


}