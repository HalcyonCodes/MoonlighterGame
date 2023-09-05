import 'package:flutter/material.dart';
import '../../../model/ViewModel/ToolViewModel/edit_account_view_model.dart';
import '../../Util/util_tools.dart';
import '../../Util/util_list.dart';
import './edit_account.dart';

class EditAccountFuture extends StatelessWidget {
  final EditAccountToolViewModel viewModel = EditAccountToolViewModel();
  final ToolUtil toolUtil;
  final ListUtil listUtil;

  EditAccountFuture(
      {super.key, required this.listUtil, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return toolUtil.listSelectId != null
        ? FutureBuilder(
            future: viewModel.refresh(toolUtil.listSelectId!),
            builder: (context, snapShot) {
              switch (snapShot.connectionState) {
                case ConnectionState.none:
                  return Text('none');

                case ConnectionState.waiting:
                  return Text('waiting');

                case ConnectionState.active:
                  return Text('active');

                case ConnectionState.done:
                  return EditAccount(
                      toolUtil: toolUtil,
                      listUtil: listUtil,
                      id: viewModel.editAccountToolViewModel!.data.accountId,
                      name:
                          viewModel.editAccountToolViewModel!.data.accountName);
              }
            })
        : SizedBox(); //提示选择选项
  }
}
