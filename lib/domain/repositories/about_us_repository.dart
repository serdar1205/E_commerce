import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/about_us.dart';

abstract class AboutUsRepository{
  Future<Either<Failure, AboutUsEntity>> getShopInfo();
}