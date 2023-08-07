import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_card_role.dart';
import 'card_retainer.dart';
import 'package:accordion/accordion.dart';

class ExpansionRetainer extends StatefulWidget {
  final String? roleName;
  final String? roleId;

  const ExpansionRetainer(
      {super.key, required this.roleId, required this.roleName});

  @override
  State<ExpansionRetainer> createState() => _ExpansionRetainerState();
}

class _ExpansionRetainerState extends State<ExpansionRetainer> {
  bool? isExpande;
  String? roleName;
  String? roleId;

  List<Widget>? retainers;

  //test
  List<String> names = ['111', '222', '333', '444', '555', '666', '777', '888'];

  @override
  void initState() {
    super.initState();
    isExpande = true;
    roleName = widget.roleName;
    roleId = widget.roleId;
  }

  @override
  Widget build(BuildContext context) {
    retainers = List.generate(names.length, (index) {
      return RetainerCard(
        containerName: names[index],
        lastUseDate: '2023/8/7',
        id: 'A-1230-B-1234',
        profile: '第1个角色第1个雇员',
        downOnTap: () {
          onDownTap(index);
        },
        upOnTap: () {
          onUpTap(index);
        },
        removeOnTap: () {
          onRemoveTap(index);
        },
      );
    });

    return Accordion(
      maxOpenSections: 2,
          headerBackgroundColorOpened: Colors.black54,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),

    
      children: [AccordionSection(
        isOpen: true,
        headerBorderRadius: 16,
        flipRightIconIfOpen: false,
          header: ExpansionRoleCard(
            onTap: () {},
            roleName: '沼泽小蛙',
            roleId: 'A-2023-08-07',
          ),
          content: ClipPath(
            clipper: RectangleClipper(),
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: retainers!),
            ),
          )),]
    );
  }

  void onHeadTap() {
    isExpande = !isExpande!;
    refreshUi();
  }

  void onUpTap(int index) {}

  void onDownTap(int index) {}

  void onRemoveTap(int index) {}

  void refreshUi() {
    setState(() {});
  }
}
