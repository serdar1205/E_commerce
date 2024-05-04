import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  final String imageUrl;

  const BannerEntity({
    required this.id,
    required this.imageUrl,
  });
  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
  };
  @override
  List<Object> get props => [id, imageUrl];
}
