import 'package:tehno_mir/core/constants/strings/endpoints.dart';
import 'package:tehno_mir/core/network/api_provider.dart';
import 'package:tehno_mir/data/models/banner_model.dart';
import '../../../domain/entities/banners.dart';

abstract class BannerRemoteDataSource {
  Future<List<BannerEntity>> getBanners();
}

class BannerRemoteDataSourceImpl extends BannerRemoteDataSource {
  final ApiProvider apiProvider;

  BannerRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<BannerEntity>> getBanners() async {
    final response = await apiProvider.get(endPoint: ApiEndpoints.banners);
    final responseBody = response.data as List;
    return responseBody.map((e) => BannerModel.fromJson(e)).toList();
  }
}
