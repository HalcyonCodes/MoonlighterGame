import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';

class ExpansionRoleCard extends StatelessWidget {
  final String? roleName;
  final String? roleId;
  final Function()? onTap;

  const ExpansionRoleCard(
      {super.key, required this.roleName, required this.roleId, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? ((1920 - 24) / 24 * 7) - 24 - 24
          : ((1920 - 24) / 24 * 7) - 24 - 24,
      decoration: KDecoration.cardSelectedDecoration,


      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 22, width: 22,
                child: SvgPicture.asset('Svg/angle_down_tool.svg', color: Colors.white,)
              ,),
              const SizedBox(width: 12,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12 ),
                child: Text(
                  '角色： ${roleName!}',
                  style: KFont.expansionHeadStyle,
                  strutStyle: const StrutStyle(leading: 0),
                ),
              
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12 ),
                child: Text(
                  roleId!,
                  style: KFont.expansionHeadStyle,
                  strutStyle: const StrutStyle(leading: 0),
                ),
              
              ),
              
            ],
          ),
        ),
      ),

    );
  }
}
