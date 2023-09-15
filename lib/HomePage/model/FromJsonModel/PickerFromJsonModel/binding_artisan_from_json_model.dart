class BindingArtisanPickerModel {
  late String code;
  late String message;
  late BindingArtisanPickerData data;

  BindingArtisanPickerModel();

  BindingArtisanPickerModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if(json['data'] != null){
      data = BindingArtisanPickerData.fromJson(json['data']);
    }
    
  }
}

class BindingArtisanPickerData {
  late List<Artisan> artisans;

  BindingArtisanPickerData();

  BindingArtisanPickerData.fromJson(Map<String, dynamic> json) {
    artisans = [];
    if (json['artisans'] != null) {
      json['artisans'].forEach((v) {
        artisans.add(Artisan.fromJson(v));
      });
    }
  }
}

class Artisan {
  late String artisanId;
  late String artisanName;
  late String artisanDesc;
  late String artisanChannel;

  Artisan();

  Artisan.fromJson(Map<String, dynamic> json) {
    artisanId = json['artisanId'];
    artisanName = json['artisanName'];
    artisanDesc = json['artisanDesc'];
    artisanChannel = json['artisanChannel'];
  }
}
