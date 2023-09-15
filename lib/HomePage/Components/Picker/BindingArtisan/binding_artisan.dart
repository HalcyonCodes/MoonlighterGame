import 'package:flutter/material.dart';
import './artisan_list_picker.dart';

import '../../../Model/ViewModel/PickerViewModel/binding_artisan_view_model.dart';
import '../../Util/util_tools.dart';

class PickerBindingArtisan extends StatefulWidget {
  final BindingArtisanPickerViewModel viewModel;
  final ToolUtil toolUtil;

  const PickerBindingArtisan({super.key, required this.viewModel, required this.toolUtil});

  @override
  State<PickerBindingArtisan> createState() => _PickerBindingArtisanState();
}

class _PickerBindingArtisanState extends State<PickerBindingArtisan> {
  @override
  Widget build(BuildContext context) {
    return PickerArtisanList(
      viewModel: widget.viewModel,
      toolUtil: widget.toolUtil,
    );
  }
}
