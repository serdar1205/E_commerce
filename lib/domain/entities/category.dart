import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String nameTm;
  final String nameEn;
  final String icon;

  const CategoryEntity({
    required this.id,
    required this.nameTm,
    required this.nameEn,
    required this.icon,
  });

  @override
  List<Object> get props => [id, nameTm, nameEn, icon];
}
