
import 'package:flutter/material.dart';

class PickerUtil {
  //Picker中改变当前选项
  Function? _changePickerCurrentIndex;
  Function? get changePickerCurrentIndex => _changePickerCurrentIndex;
  void setFuncChangePickerCurrentIndex(Function? func) {
    _changePickerCurrentIndex = func;
  }

  //SettingShelf中改变shelfTitle数目
  Function? _changeSettingShelfTitleCount;
  Function? get changeSettingShelfTitleCount => _changeSettingShelfTitleCount;
  void setFuncChangeSettingShelfTitleCount(Function? func) {
    _changeSettingShelfTitleCount = func;
  }

  //SettingMaterial中改变MaterialTitle数目
  Function? _changeSettingMaterialTitleCount;
  Function? get changeSettingMaterialTitleCount =>
      _changeSettingMaterialTitleCount;
  void setFuncChangeSettingMaterialTitleCount(Function? func) {
    _changeSettingMaterialTitleCount = func;
  }

  //SellBrowsing中修改日历按钮选中
  List<Function>? _listChangeSellBrowsingCalendarSelect;
  List<Function>? get listChangeSellBrowsingCalendarSelect => _listChangeSellBrowsingCalendarSelect;
  
  void addListChangeSellBrowsingCalendarSelect(Function? func){
    _listChangeSellBrowsingCalendarSelect!.add(func!);
  }


  void setFuncListChangeSellBrowsingCalendarSelect(List<Function>? funcs) {
    _listChangeSellBrowsingCalendarSelect = funcs;
  }

  //Picker编辑时的TextEditorController列表
  List<TextEditingController>? _textCtrs;
  List<TextEditingController>? get textCtrs => _textCtrs;
  void setListTextCtrs(List<TextEditingController>? list) {
    _textCtrs = list!;
  }

  void addListTextCtrs(TextEditingController? ctr) {
    _textCtrs!.add(ctr!);
  }

  //PickerSettingTag中刷新tagList列表
  Function? _refreshTagList;
  Function? get refreshTagList => _refreshTagList;
  void setFuncRefreshTagList(Function? func) {
    _refreshTagList = func;
  }



}
