import 'package:tehno_mir/data/models/about_us_model.dart';
import 'package:tehno_mir/domain/entities/about_us.dart';

import '../../../core/constants/strings/endpoints.dart';
import '../../../core/network/api_provider.dart';

abstract class AboutUsRemoteDataSource {
  Future<AboutUsEntity> getShopInfo();
}

class AboutUsRemoteDataSourceImpl implements AboutUsRemoteDataSource {
  final ApiProvider apiProvider;

  AboutUsRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<AboutUsEntity> getShopInfo() async {
    final response = await apiProvider.get(endPoint: ApiEndpoints.aboutUs);
    return AboutUsModel.fromJson(response.data);
  }
}