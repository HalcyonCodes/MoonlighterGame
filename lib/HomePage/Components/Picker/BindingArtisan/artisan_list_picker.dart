import 'package:flutter/material.dart';
import './artisan_card_picker.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';

class PickerArtisanList extends StatefulWidget {
  const PickerArtisanList({super.key});

  @override
  State<PickerArtisanList> createState() => _PickerArtisanListState();
}

class _PickerArtisanListState extends State<PickerArtisanList> {
  List<Widget>? items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(12, (index) {
      return PickerRoleCard(
          id: 'id',
          category: 'category',
          name: 'name',
          profile: 'profile',
          addOnTap: () {});
    });

    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 - 24,
      child: ClipPath(
        clipper: RectangleClipper(),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
          ),
        ),
      ),
    );

  }
}
