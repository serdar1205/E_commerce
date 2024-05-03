import 'package:tehno_mir/domain/entities/about_us.dart';

class AboutUsModel extends AboutUsEntity {
  const AboutUsModel({
    required super.id,
    required super.titleTm,
    required super.titleEn,
    required super.phoneNumber,
    required super.email,
    required super.addressTm,
    required super.addressEn,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        id: json["id"],
        titleTm: json["title_tm"],
        titleEn: json["title_en"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        addressTm: json["address_tm"],
        addressEn: json["address_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_tm": titleTm,
        "title_en": titleEn,
        "phone_number": phoneNumber,
        "email": email,
        "address_tm": addressTm,
        "address_en": addressEn,
      };
}
