import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/domain/entities/category.dart';

abstract class CategoryRepository{
  Future<Either<Failure,List<CategoryEntity>>> getCategoryNames();
}