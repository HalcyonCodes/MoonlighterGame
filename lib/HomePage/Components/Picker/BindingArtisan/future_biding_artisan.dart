import 'package:flutter/material.dart';

import '../../../Model/ViewModel/PickerViewModel/binding_artisan_view_model.dart';

import './binding_artisan.dart';

import '../../Util/util_tools.dart';

class PickerBindingArtisanFuture extends StatelessWidget {
  final BindingArtisanPickerViewModel viewModel =
      BindingArtisanPickerViewModel();
  final ToolUtil toolUtil;
  PickerBindingArtisanFuture({super.key, required this.toolUtil});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.refresh(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.done:
              return PickerBindingArtisan(
                viewModel: viewModel,
                toolUtil: toolUtil,
              );
          }
        });
  }
}
