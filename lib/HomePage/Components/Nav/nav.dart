import 'package:flutter/material.dart';
import 'package:moonlighter/Config/index.dart';
import './select_button.dart';


class Nav extends StatelessWidget {
  final int selectIndex;
  const Nav({super.key, required this.selectIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 24 * 2,
        width: 
        MediaQuery.of(context).size.width <= 1920 ?
        1920 / 24 * 2 - 24 : 
        1920 / 24 * 2 - 24
        ,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: KDecoration.navDecoration,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 182,
              ),
              SelectButton(isSelected: selectIndex == 0 ? true : false, iconPath: 'Svg/terminal_nav.svg', onClick: firstSelect,),
              const SizedBox(height: 16,),
              SelectButton(isSelected: selectIndex == 1 ? true : false , iconPath: 'Svg/code_nav.svg', onClick: secondSelect,),
              const SizedBox(height: 16,),
              SelectButton(isSelected: selectIndex == 2 ? true: false , iconPath: 'Svg/robot_nav.svg', onClick: thirdSelect,),

            ],
          ),
        ));
  }

  Function()? firstSelect(){

  }

  Function()? secondSelect(){

  }

  Function()? thirdSelect(){

  }


}
