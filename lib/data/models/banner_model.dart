import 'package:tehno_mir/domain/entities/banners.dart';


class BannerModel extends BannerEntity{
  const BannerModel({required super.id, required super.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
  };

}