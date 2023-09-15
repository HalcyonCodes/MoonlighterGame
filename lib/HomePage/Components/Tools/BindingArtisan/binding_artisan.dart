import 'dart:io';

import 'package:flutter/material.dart';
import '../../Util/util_tools.dart';
import '../../../../PublicWidgets/CommitTitle/commit_title.dart';
import '../../../../Config/index.dart';
import './future_list_expansion.dart';
import '../../../Model/ViewModel/ToolViewModel/binding_artisan_view_model.dart';
import '../../Util/util_picker.dart';



class BindingArtisan extends StatefulWidget {
  final ToolUtil toolUtil;
  final PickerUtil pickerUtil;
   
  const BindingArtisan({super.key, required this.toolUtil,  required this.pickerUtil});


  @override
  State<BindingArtisan> createState() => _BindingArtisanState();
}

class _BindingArtisanState extends State<BindingArtisan> {
  final BindingArtisanToolViewModel viewModel = BindingArtisanToolViewModel();
 


    @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CommitTitle(
            iconPath: 'Svg/artisan_tool.svg', title: KString.settingArtisan, commit: commit, cancel: cancel,
            ),
        const SizedBox(
          height: 16,
        ),
        ExpansionListFuture(
          toolUtil: widget.toolUtil,
          viewModel: viewModel,
        )
      ],
    );
  }

  void commit() async{
    int statusCode = await viewModel.updateArtisan();
    if(statusCode == HttpStatus.ok){
      //1.提示修改成功
      //2.关闭
      widget.toolUtil.changeTool!(15);
      widget.pickerUtil.changePickerCurrentIndex!(15);

    }else{
      //1.提示修改失败

    }
  }

  void cancel() {
    widget.toolUtil.changeTool!(15);
    widget.pickerUtil.changePickerCurrentIndex!(15);
  }
}