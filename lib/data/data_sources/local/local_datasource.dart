// import 'dart:convert';
//
// import 'package:tehno_mir/core/error/error_handler.dart';
// import 'package:tehno_mir/data/models/banner_model.dart';
// import 'package:tehno_mir/domain/entities/banners.dart';
//
// const CACHE_BANNER_KEY = "CACHE_Banner_KEY";
// const CACHE_BANNER_INTERVAL = 10; // 1 MINUTE IN MILLIS
//
// abstract class LocalDataSource {
//   Future<List<BannerEntity>> getBanner();
//
//   Future<void> saveBannerToCache(List<BannerEntity> bannerEntity);
//
//   void clearCache();
//
//   void removeFromCache(String key);
// }
//
// class LocalDataSourceImpl implements LocalDataSource {
//   Map<String , CachedItem> cacheMap = Map();
//
//   @override
//   // Future<List<BannerEntity>> getBanner()async {
//   //   CachedItem? cachedItem = cacheMap[CACHE_BANNER_KEY];
//   //   print('------------${cachedItem!.data}');
//   //   if (cachedItem != null && cachedItem.isValid(CACHE_BANNER_INTERVAL)) {
//   //
//   //     final responseBody = cachedItem.data as List;
//   //    print('////////////////local banner////// $responseBody///////////');
//   //
//   //    final result = responseBody.map((e) => BannerModel.fromJson(e)).toList();
//   //    print('8888888888 $result 888888888');
//   //
//   //     //
//   //     // final jsonString = cachedItem.data as String;
//   //     //   print('////////////////local banner////// $jsonString///////////');
//   //     //
//   //     // final decodedData = jsonDecode(jsonString) as List<dynamic>;
//   //     // final result = decodedData.map((e) => BannerModel.fromJson(e)).toList();
//   //     //  print('8888888888 $result 888888888');
//   //
//   //
//   //     return result;
//   //
//   //   //  return cachedItem.data;
//   //   }  else{
//   //     throw ErrorHandler.handle(DataSource.CACHE_ERROR);
//   //   }
//   // }
//
//
//
//
//
//   @override
//   // Future<void> saveBannerToCache(List<BannerEntity> bannerEntity)async {
//   //
//   //   cacheMap[CACHE_BANNER_KEY] = CachedItem(bannerEntity);
//   //
//   // }
//   Future<void> saveBannerToCache(List<BannerEntity> bannerEntity) async {
//     print('////////////////Saved/////////////////');
//     final jsonString = jsonEncode(bannerEntity.map((e) => e.toJson()).toList());
//     cacheMap[CACHE_BANNER_KEY] = CachedItem(jsonString);
//     print(jsonString);
//     print('////////////////');
//     print(cacheMap[CACHE_BANNER_KEY]!.data);
//
//   }
//
//   @override
//   void removeFromCache(String key) {
//     cacheMap.remove(key);
//   }
//   @override
//   void clearCache() {
//     cacheMap.clear();
//   }
// }
//
// class CachedItem {
//   dynamic data;
//   int cacheTime = DateTime.now().second;
//
//   CachedItem(this.data);
// }
//
// extension CachedItemExtension on CachedItem {
//   bool isValid(int expirationTime) {
//     int currentTimeInMillis = DateTime.now().second;
//     bool isCachedValid = currentTimeInMillis - expirationTime < cacheTime;
//     return isCachedValid;
//   }
// }
