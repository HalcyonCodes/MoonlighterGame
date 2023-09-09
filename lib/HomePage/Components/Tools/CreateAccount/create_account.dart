import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';
import 'package:moonlighter/HomePage/Components/Util/util_list.dart';
import '../../../Model/ViewModel/ToolViewModel/create_account_view_model.dart';
import './create_card.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../Util/util_tools.dart';

class CreateAccount extends StatelessWidget {
  final ListUtil listUtil;
  final ToolUtil toolUtil;
  final CreateAccountToolViewModel viewModel = CreateAccountToolViewModel();

  CreateAccount({super.key, required this.toolUtil, required this.listUtil});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
            cancel: cancel,
            commit: commit,
            iconPath: 'Svg/account_tool.svg',
            title: KString.createAccount),
        const SizedBox(
          height: 16,
        ),
        CreateCard(
          id: '',
          name: '',
          toolUtil: toolUtil,
        )
      ],
    );
  }

  void commit() async {
    String inputId = toolUtil.textCtrs![0].text;
    String inputName = toolUtil.textCtrs![1].text;
    int statusCode = await viewModel.createAccount(inputId, inputName);
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
