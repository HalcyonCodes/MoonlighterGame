import 'package:flutter/material.dart';

class BodyCard extends StatefulWidget {
  final String? retainerName;
  final String? retainerId;
  final String? artisanId;
  final String? artisanName;
  final String? artisanChannel;
  

  const BodyCard({super.key, this.retainerId, this.retainerName});

  @override
  State<BodyCard> createState() => _BodyCardState();
}

class _BodyCardState extends State<BodyCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
