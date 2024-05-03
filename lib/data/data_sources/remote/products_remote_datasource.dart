import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/network/api_provider.dart';
import 'package:tehno_mir/data/models/product/products_model.dart';
import 'package:tehno_mir/domain/entities/product/product.dart';
import '../../../domain/usecases/products/get_category_products_usecase.dart';
import '../../../domain/usecases/products/get_product_usecase.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductEntity>> getCategoryProducts(CategoryProductsQueryParams params);


  Future<List<ProductEntity>> getSearchResult(String keyword);

  Future<List<ProductEntity>> getProducts(ProductQueryParameters params);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final ApiProvider apiProvider;

  ProductsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<ProductEntity>> getCategoryProducts(CategoryProductsQueryParams params) async {
    final queryParameters = params.toQueryParameters();
    final response = await apiProvider.get(
        endPoint: ApiEndpoints.categoryProducts,
        query: queryParameters,
    );

    final responseBody = response.data as List;
    return responseBody.map((e) => ProductsModel.fromJson(e)).toList();
  }

  @override
  Future<List<ProductEntity>> getSearchResult(String keyword) async {
    final response = await apiProvider.post(
      data: {'search': keyword},
      endPoint: ApiEndpoints.search,
    );
    if (response.data.containsKey('search_results')) {
      final List<dynamic> responseBody = response.data['search_results'];
      return responseBody
          .map((e) => ProductsModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<ProductEntity>> getProducts(ProductQueryParameters params) async {
    final queryParameters = params.toQueryParameters();
    final response = await apiProvider.get(
        endPoint: ApiEndpoints.allProducts,
      query: queryParameters,
   //  endPoint: '${ApiEndpoints.allProducts}?sortBy=${params.sortBy}&order=${params.order}&limit=${params.limit}'//ApiEndpoints.categoryProducts,

    );

    final responseBody = response.data as List;
    return responseBody.map((e) => ProductsModel.fromJson(e)).toList();
  }
}
