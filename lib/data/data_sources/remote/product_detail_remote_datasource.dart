import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/network/api_provider.dart';
import 'package:tehno_mir/data/models/product_detail_model.dart';
import '../../../domain/entities/product_detail.dart';

abstract class ProductDetailRemoteDataSource {
  Future<ProductDetailEntity> getProductDetail(int productId);
}

class ProductDetailRemoteDataSourceImpl implements ProductDetailRemoteDataSource {
  final ApiProvider apiProvider;

  ProductDetailRemoteDataSourceImpl(this.apiProvider);

  @override
  Future<ProductDetailEntity> getProductDetail(int productId) async {
    final response = await apiProvider.get(
        endPoint: ApiEndpoints.productDetail, query: {'product_id': productId});
    return ProductDetailModel.fromJson(response.data);
  }
}
