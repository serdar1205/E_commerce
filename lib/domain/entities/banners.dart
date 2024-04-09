import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final int id;
  final String imageUrl;

  const BannerEntity({
    required this.id,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, imageUrl];
}
