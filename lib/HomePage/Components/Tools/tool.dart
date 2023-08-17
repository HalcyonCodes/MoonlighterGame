import 'package:flutter/material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingMaterial/setting_material.dart';
import 'package:moonlighter/HomePage/Components/Tools/SettingRetainer/setting_retainer.dart';
import '../../../PublicWidgets/ToolTitle/title_tool.dart';
import '../../../Config/index.dart';
import 'button_tool.dart';
import 'delect_button_tool.dart';
import './CreateAccount/create_account.dart';
import './EditAccount/edit_account.dart';
import './SettingTag/setting_tag.dart';
import './SettingRobot/setting_robot.dart';
import './SettingRole/setting_role.dart';
import '../Util/util_tools.dart';
import './ItemBrowsing/Item_browsing.dart';
import './../../Components/Tools/OrderManager/order_manager.dart';
import './BindingArtisan/binding_artisan.dart';
import './SellBrowsing/sell_browsing.dart';
import './SettingMaterial/setting_material.dart';
import './SettingShelf/setting_shelf.dart';

class Tool extends StatefulWidget {
  const Tool({super.key});

  @override
  State<Tool> createState() => _ToolState();
}

class _ToolState extends State<Tool> {

  ToolUtil toolUtil = ToolUtil();

  int? index;


  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: MediaQuery.of(context).size.width <= 1920 ? 
         (1920 - 24) / 24 * 7 - 24
      :  (1920 - 24) / 24 * 7 - 24
      ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ToolTitle(iconPath: 'Svg/tool_tool.svg', name: KString.tool),
          const SizedBox(height: 16,),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              ToolButton(isSelect: index == 0 ? true : false, onTap: (){ index = 0; refreshUi();}, path: 'Svg/account_tool.svg', name: KString.create),
              ToolButton(isSelect: index == 1 ? true : false, onTap: (){ index = 1; refreshUi();}, path: 'Svg/edit_tool.svg', name: KString.edit),
              ToolButton(isSelect: index == 2 ? true : false, onTap: (){ index = 2; refreshUi();}, path: 'Svg/tag_tool.svg', name: KString.tag),
              ToolButton(isSelect: index == 3 ? true : false, onTap: (){ index = 3; refreshUi();}, path: 'Svg/robot_tool.svg', name: KString.robot),
              ToolButton(isSelect: index == 4 ? true : false, onTap: (){ index = 4; refreshUi();}, path: 'Svg/log_tool.svg', name: KString.log),
              ToolButton(isSelect: index == 5 ? true : false, onTap: (){ index = 5; refreshUi();}, path: 'Svg/role_tool.svg', name: KString.role),
              ToolButton(isSelect: index == 6 ? true : false, onTap: (){ index = 6; refreshUi();}, path: 'Svg/retainer_tool.svg', name: KString.container),
              ToolButton(isSelect: index == 7 ? true : false, onTap: (){ index = 7; refreshUi();}, path: 'Svg/order_tool.svg', name: KString.order),
              ToolButton(isSelect: index == 8 ? true : false, onTap: (){ index = 8; refreshUi();}, path: 'Svg/item_tool.svg', name: KString.item),
              ToolButton(isSelect: index == 9 ? true : false, onTap: (){ index = 9; refreshUi();}, path: 'Svg/artisan_tool.svg', name: KString.artisan),
              ToolButton(isSelect: index == 10 ? true : false, onTap: (){ index = 10; refreshUi();}, path: 'Svg/shelf_tool.svg', name: KString.shelf),
              ToolButton(isSelect: index == 11 ? true : false, onTap: (){ index = 11; refreshUi();}, path: 'Svg/bill_tool.svg', name: KString.bill),
              ToolButton(isSelect: index == 12 ? true : false, onTap: (){ index = 12; refreshUi();}, path: 'Svg/material_tool.svg', name: KString.material),
              ToolButton(isSelect: index == 13 ? true : false, onTap: (){ index = 13; refreshUi();}, path: 'Svg/company_tool.svg', name: KString.company),
              DelectButton(isSelect: index == 14 ? true : false, onLongTap: (){ index = 14; refreshUi();}, path: 'Svg/delect_tool.svg', name: KString.delect),
            ],
          ),
          const SizedBox(height: 32,),
          index == 0 ? CreateAccount(): 
          index == 1 ? EditAccount() : 
          index == 2 ? SettingTag() : 
          index == 3 ? SettingRobot():
          index == 4 ? SizedBox() : 
          index == 5 ? SettingRole(roleCount: '5'):
          index == 6 ? SettingRetainer(toolUtil: toolUtil,):
          index == 7 ? OrderManager() :
          index == 8 ? ItemBrowsing(toolUtil: toolUtil):
          index == 9 ? BindingArtisan(util: toolUtil):
          index == 10 ? SettingShelf(toolUtil: toolUtil):
          index == 11 ? SellBrowsing(toolUtil: toolUtil) :
          index == 12 ? SettingMaterial(toolUtil: toolUtil,) :
          SizedBox()

    
    
        ],
      ),
    );
  }



  void refreshUi(){
    setState(() {
      
    });
  }
}