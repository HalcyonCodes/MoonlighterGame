import 'package:flutter/material.dart';
import './artisan_list_picker.dart';

class PickerBindingArtisan extends StatefulWidget {
  const PickerBindingArtisan({super.key});

  @override
  State<PickerBindingArtisan> createState() => _PickerBindingArtisanState();
}

class _PickerBindingArtisanState extends State<PickerBindingArtisan> {
  @override
  Widget build(BuildContext context) {
    return PickerArtisanList();
  }
}
