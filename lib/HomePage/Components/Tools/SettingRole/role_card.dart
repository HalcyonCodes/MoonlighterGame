import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Config/index.dart';

class RoleCard extends StatefulWidget {
  final String? id;
  final String? category;
  final String? name;
  final String? profile;
  final Function()? upOnTap;
  final Function()? downOnTap;
  final Function()? removeOnTap;
  final Function()? onCardTap;

  const RoleCard({
    super.key,
    required this.id,
    required this.category,
    required this.name,
    required this.profile,
    required this.downOnTap,
    required this.upOnTap,
    required this.removeOnTap,
    required this.onCardTap,
  });

  @override
  State<RoleCard> createState() => _RoleCardState();
}

class _RoleCardState extends State<RoleCard> {
  @override
  void initState() {
    super.initState();
    //注册

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
         ? ((1920 - 24) / 24 * 7) - 24 - 24 - 24
         : ((1920 - 24) / 24 * 7) - 24 - 24 - 24,
      decoration: KDecoration.cardDecoration,
      child: InkWell(
        onTap: widget.onCardTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SizedBox(
            width: MediaQuery.of(context).size.width <= 1920
                ? (1920 - 24) / 24 * 7 - 24 - 24 - 24
                : (1920 - 24) / 24 * 7 - 24 - 24 - 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.id!,
                      style: KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      widget.category!,
                      style: KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.name!,
                            style: KFont.cardTitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            widget.profile!,
                            style: KFont.cardProfileStyle,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Expanded(child: SizedBox()),
                      InkWell(
                        onTap: widget.upOnTap,
                        borderRadius: BorderRadius.circular(99),
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: SvgPicture.asset('Svg/up_card.svg'),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: widget.downOnTap,
                        borderRadius: BorderRadius.circular(99),
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: SvgPicture.asset('Svg/down_card.svg'),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: widget.removeOnTap,
                        borderRadius: BorderRadius.circular(99),
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: SvgPicture.asset('Svg/minus_card.svg'),
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setIsSelect(bool b) {
    //isSelect = b;
    refreshUi();
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }
}
