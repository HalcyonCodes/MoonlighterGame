import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';
import 'edit_card.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_tools.dart';
import '../../../Model/ViewModel/ToolViewModel/edit_account_view_model.dart';
import '../../Util/util_list.dart';

class EditAccount extends StatelessWidget {
  final ToolUtil toolUtil;
  final ListUtil listUtil;
  final String id;
  final String name;
  final EditAccountToolViewModel viewModel = EditAccountToolViewModel();

  EditAccount({super.key, required this.toolUtil, required this.listUtil, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
          iconPath: 'Svg/edit_tool.svg',
          title: KString.editAccount,
          commit: commit,
          cancel: cancel,
        ),
        const SizedBox(
          height: 16,
        ),
        EditCard(id: id, name: name, toolUtil: toolUtil,)
      ],
    );
  }

  void commit() async {
    String inputId = toolUtil.textCtrs![0].text;
    String inputName = toolUtil.textCtrs![1].text;
    int statusCode = await viewModel.editAccount(inputId, inputName);
    if (statusCode == 200) {
      //1.提示提交成功
      print('成功');
      //2.退出选项
      toolUtil.changeTool!(15);
      //3.刷新list列表
      listUtil.refreshList!();
    } else {
      //1.提示提交失败
    }
  }

  void cancel() {
    toolUtil.changeTool!(15);
  }
}
