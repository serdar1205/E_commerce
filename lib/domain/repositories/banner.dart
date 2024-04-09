import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/banners.dart';

abstract class BannerRepository{
  Future<Either<Failure, List<BannerEntity>>> getBanners();
}