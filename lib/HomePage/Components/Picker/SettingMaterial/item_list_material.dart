import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Config/index.dart';
import './item_material.dart';

class MaterialItemList extends StatefulWidget {
  const MaterialItemList({super.key});

  @override
  State<MaterialItemList> createState() => _MaterialItemListState();
}

class _MaterialItemListState extends State<MaterialItemList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(5, (index) {
      return MaterialItemInput(
        itemName: '纤维手套',
        itemType: '1',
        delectOnTap: () {},
      );
    });

    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  KString.itemName,
                  style: KFont.cardProfileStyle,
                ),
                const Expanded(child: SizedBox()),
                SizedBox(
                    width: 21,
                    child: Text(
                      KString.itemStyle,
                      style: KFont.cardProfileStyle,
                    )),
                const SizedBox(
                  width: 70 - 24,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: items!,
            ),
            SizedBox(
              height: 22,
              width: 22,
              child: InkWell(
                onTap: (){},
                child: SvgPicture.asset('Svg/plus_card.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
