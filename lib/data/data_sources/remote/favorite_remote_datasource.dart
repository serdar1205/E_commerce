import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/network/api_provider.dart';
import 'package:tehno_mir/data/models/product/products_model.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';

abstract class FavoriteRemoteDataSource {
  Future<List<ProductEntity>> getFavorites();

  Future<List<ProductEntity>> addFavorite(int productId);

  Future<List<ProductEntity>> removeFavorite(int productId);
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final ApiProvider apiProvider;

  FavoriteRemoteDataSourceImpl(this.apiProvider);

  @override
  Future<List<ProductEntity>> addFavorite(int productId) async {
    try {
      final response = await apiProvider.post(
          endPoint: ApiEndpoints.favorites, query: {'product_id': productId});
      if (response.statusCode == 201) {
        final responseBody = response.data as List;
        return responseBody.map((e) => ProductsModel.fromJson(e['product'])).toList();
      }
      else{
        throw '';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> getFavorites() async{
    try {
      final response = await apiProvider.get(
          endPoint: ApiEndpoints.favorites);
      if (response.statusCode == 200) {
        print(response.data);
        final responseBody = response.data as List;

        return responseBody.map((e) => ProductsModel.fromJson(e['product'])).toList();
      }
      else{
        throw '';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> removeFavorite(int productId)async {
    try {
      final response = await apiProvider.delete(
          endPoint: ApiEndpoints.favorites,query: {'product_id': productId});
      if (response.statusCode == 204) {
       print('Deleted');
        var favorites =  await getFavorites();
        return favorites;
      }
      else{
        throw '';
      }
    } catch (e) {
      rethrow;
    }
  }
}
