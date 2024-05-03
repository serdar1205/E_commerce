
import 'package:tehno_mir/core/network/api_provider.dart';
import 'package:tehno_mir/data/models/category_model.dart';
import 'package:tehno_mir/domain/entities/category.dart';

import '../../../core/constants/strings/endpoints.dart';

abstract class CategoryRemoteDataSource{
  Future<List<CategoryEntity>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource{
  final ApiProvider apiProvider;

  CategoryRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<CategoryEntity>> getCategories()async {
    final response = await apiProvider.get(endPoint: ApiEndpoints.categories);
    final responseBody = response.data as List;
    
    return responseBody.map((e) => CategoryModel.fromJson(e)).toList();
  }

}