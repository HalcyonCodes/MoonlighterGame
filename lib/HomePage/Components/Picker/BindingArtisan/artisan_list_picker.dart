import 'package:flutter/material.dart';
import './artisan_card_picker.dart';
import '../../../../ToolWidgets/rectangle_cliper.dart';
import '../../../Model/ViewModel/PickerViewModel/binding_artisan_view_model.dart';
import '../../Util/util_tools.dart';
import '../../../Model/FromJsonModel/ToolFromJsonModel/binding_artisan_from_json_model.dart';

class PickerArtisanList extends StatefulWidget {
  final BindingArtisanPickerViewModel viewModel;
  final ToolUtil toolUtil;

  const PickerArtisanList({super.key, required this.viewModel, required this.toolUtil});

  @override
  State<PickerArtisanList> createState() => _PickerArtisanListState();
}

class _PickerArtisanListState extends State<PickerArtisanList> {
  List<Widget>? items;

  @override
  void initState() {
    super.initState();
    items = [];
  }

  @override
  Widget build(BuildContext context) {
    items = List.generate(
        widget.viewModel.bindingArtisanPickerModel!.data.artisans.length,
        (index) {
      return PickerRoleCard(
          id: widget.viewModel.bindingArtisanPickerModel!.data.artisans[index]
              .artisanId,
          category: widget.viewModel.bindingArtisanPickerModel!.data
              .artisans[index].artisanChannel,
          name: widget.viewModel.bindingArtisanPickerModel!.data.artisans[index]
              .artisanName,
          profile: widget.viewModel.bindingArtisanPickerModel!.data
              .artisans[index].artisanDesc,
          addOnTap: () {
            onTap(index);
          });
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

  void onTap(int index) {
    Artisan artisan = Artisan();
    artisan.artisanId = widget.viewModel.bindingArtisanPickerModel!.data.artisans[index].artisanId;
    artisan.artisanName = widget.viewModel.bindingArtisanPickerModel!.data.artisans[index].artisanName;
    artisan.artisanDesc = widget.viewModel.bindingArtisanPickerModel!.data.artisans[index].artisanDesc;
    artisan.artisanChannel = widget.viewModel.bindingArtisanPickerModel!.data.artisans[index].artisanChannel;

    widget.toolUtil.listFuncInsertArtisan![widget.toolUtil.currentRoleIndex](artisan);
  }
}
