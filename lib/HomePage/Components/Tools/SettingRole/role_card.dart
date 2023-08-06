import 'package:flutter/material.dart';
import '../../../../Config/index.dart';

class RoleCard extends StatelessWidget {
  final String? id;
  final String? category;
  final String? name;
  final String? profile;

  const RoleCard({
    super.key,
    this.id,
    this.category,
    this.name,
    this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: KDecoration.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
