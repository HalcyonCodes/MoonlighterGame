import 'package:flutter/material.dart';
import '../Config/index.dart';
import './Components/Nav/nav.dart';
import './Components/List/terminal_list.dart';
import './Components/Tools/tool.dart';
import './Components/Util/util_picker.dart';
import './Components/Util/util_list.dart';
import './Components/Util/util_tools.dart';
import './Components/Picker/picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ToolUtil? toolUtil;
  PickerUtil? pickerUtil;
  

  @override
  void initState() {
    super.initState();
    toolUtil = ToolUtil();
    pickerUtil = PickerUtil();
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width <= 1920
                ? 1920
                : 1920,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Nav(selectIndex: 0),
                  SizedBox(width: 24,),
                  TerminalList(),
                  SizedBox(width: 24,),
                  Tool(toolUtil: toolUtil!,pickerUtil: pickerUtil!,),
                  SizedBox(width: 24,),
                  Picker(pickerUtil: pickerUtil!,),


                ],
              ),
            )
          ),
      ),
    );
  }
}