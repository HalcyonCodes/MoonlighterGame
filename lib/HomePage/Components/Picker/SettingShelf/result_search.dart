import 'package:flutter/material.dart';
import '../../../../Config/index.dart';

class SearchResult extends StatelessWidget {
  final String? id;
  final String? category;
  final String? name;
  final String? profile;
  final Function()? onLongTap;


  const SearchResult({
    super.key,
    required this.id,
    required this.category,
    required this.name,
    required this.profile,
    required this.onLongTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width <= 1920
          ? (1920 - 24) / 24 * 8 - 24
          : (1920 - 24) / 24 * 8 - 24,
      decoration: KDecoration.cardDecoration,
      child: SizedBox(
          width: MediaQuery.of(context).size.width <= 1920
              ? (1920 - 24) / 24 * 8 - 24 - 24 - 24
              : (1920 - 24) / 24 * 8 - 24 - 24 - 24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      id!,
                      style: KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      category!,
                      style: KFont.cardProfileStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            name!,
                            style: KFont.cardTitleStyle,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            profile!,
                            style: KFont.cardProfileStyle,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
              
                       
                    ]),
              )
              ,
              const SizedBox(height: 12,),
              Container(
                height: 46,
                decoration: BoxDecoration(
                  color: KColor.primaryColor,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                ),
                child: InkWell(
                  onLongPress: (){},
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                  child : Padding(padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      KString.copyData, 
                      style: KFont.toolTitleButtonStyle,
                      strutStyle: const StrutStyle(leading: 0),),
                  ),
                ),))
            ],
          ),
        ),
      
    );
  }
}
