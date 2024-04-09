import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/banners.dart';
import 'package:tehno_mir/domain/repositories/banner.dart';

class GetBannerUseCase extends BaseUseCase<NoParams, List<BannerEntity>> {
  final BannerRepository repository;

  GetBannerUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BannerEntity>>> execute( input) async {
    return await repository.getBanners();
  }
}
