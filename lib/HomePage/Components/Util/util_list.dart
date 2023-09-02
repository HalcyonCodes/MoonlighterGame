class ListUtil {
  //设置选中状态的方法的列表
  List<Function()>? _listFuncCancelSelected;
  List<Function()>? get listFuncCancelSelected => _listFuncCancelSelected;
  int addListFuncCancelSelected(Function()? list) {
    _listFuncCancelSelected!.add(list!);
    return _listFuncCancelSelected!.length - 1;
  }

  void setListFuncCancelSelected(List<Function()>? list) {
    _listFuncCancelSelected = list;
  }

  void removeListFuncCancelSelected(Function() i) {
    _listFuncCancelSelected!.remove(i);
  }

  //设置搜索Tag字符串
  Function(String)? _setSearchTagString;
  Function(String)? get setSearchTagString => _setSearchTagString;
  void setFuncSearchTagString(Function(String)? i) {
    _setSearchTagString = i;
  }

  //设置搜索Name字符串
  Function(String)? _setSearchNameString;
  Function(String)? get setSearchNameString => _setSearchNameString;
  void setFuncSearchNameString(Function(String)? i) {
    _setSearchNameString = i;
  }

  //设置搜索Id字符串
  Function(String)? _setSearchIdString;
  Function(String)? get setSearchIdString => _setSearchIdString;
  void setFuncSearcIdString(Function(String)? i) {
    _setSearchIdString = i;
  }

  //刷新列表
  Function()? _refreshList;
  Function()? get refreshList => _refreshList;
  void setFuncRefreshList(Function()? i) {
    _refreshList = i;
  }

  //清空搜索刷新列表
  Function()? _refreshListNormal;
  Function()? get refreshListNormal => _refreshListNormal;
  void setFuncRefreshListNormal(Function()? i) {
    _refreshListNormal = i;
  }



}
