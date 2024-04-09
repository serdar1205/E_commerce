import 'package:dartz/dartz.dart';
import 'package:tehno_mir/core/error/failure.dart';
import 'package:tehno_mir/core/usecase/usecase.dart';
import 'package:tehno_mir/domain/entities/category.dart';
import 'package:tehno_mir/domain/repositories/categories.dart';

class GetCategoryUseCase extends BaseUseCase<NoParams, List<CategoryEntity>>{

  final CategoryRepository repository;

  GetCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> execute(NoParams input) async{
    return await repository.getCategoryNames();
  }
}