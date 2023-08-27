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
}
