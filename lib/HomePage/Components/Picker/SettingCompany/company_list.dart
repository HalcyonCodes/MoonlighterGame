import 'package:flutter/material.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import './company_card.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key});

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = List.generate(7, (index) {
      return CompanyCard(
        companyName: 'Company Name $index',
        companyChannel: '魔杜纳',
        companyId: '123',
        companyProfile: '第一个公会',
        memberCount: '16',
        marketValue: '13,000,000,000',
        onTap: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            clipBehavior: Clip.none,
            children: items!,
          ),
        ),
      ),
    );
  }
}
