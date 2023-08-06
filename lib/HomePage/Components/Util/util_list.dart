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
}
