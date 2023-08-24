import 'package:flutter/material.dart';
import './retainer_search_bar.dart';
import './result_search.dart';

class RetainerSearch extends StatefulWidget {
  const RetainerSearch({super.key});

  @override
  State<RetainerSearch> createState() => _RetainerSearchState();
}

class _RetainerSearchState extends State<RetainerSearch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RetainerSearchBar(),
          SizedBox(height: 16,),
          SearchResult(id: 'id', category: 'category', name: 'name', profile: 'profile', onLongTap: (){}),
        ]
      ),
    );
  }
}
