import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './expansion_retainer.dart';

class RetainerList extends StatefulWidget {
  const RetainerList({super.key});

  @override
  State<RetainerList> createState() => _RetainerListState();
}

class _RetainerListState extends State<RetainerList> {
  List<ExpansionRetainer>? items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(3, (index) {
      return ExpansionRetainer(
        roleId: 'A-333-222-111',
        roleName: '沼泽小鳄',
      );
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height -
          24 -
          24 -
          46 -
          (55 + 8 + 17 + 16) * 3 -
          32 -
          46 -
          16,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: items!,
        ),
      ),
    );
  }
}
