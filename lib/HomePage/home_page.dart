import 'package:flutter/material.dart';
import '../Config/index.dart';
import './Components/Nav/nav.dart';
import './Components/List/terminal_list.dart';
import './Components/Tools/tool.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  Tool(),

                ],
              ),
            )
          ),
      ),
    );
  }
}
