import 'package:tehno_mir/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.nameTm,
    required super.nameEn,
    required super.icon,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameTm: json["name_tm"],
        nameEn: json["name_en"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_tm": nameTm,
        "name_en": nameEn,
        "icon": icon,
      };
}
