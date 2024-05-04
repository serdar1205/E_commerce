import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tehno_mir/data/data_sources/remote/about_us_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/banner_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/category_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/favorite_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/order_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/product_detail_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/user_remote_datasource.dart';
import 'package:tehno_mir/data/repositories/banner_repository.dart';
import 'package:tehno_mir/data/repositories/category_repository.dart';
import 'package:tehno_mir/data/repositories/favorite_repository_impl.dart';
import 'package:tehno_mir/data/repositories/product_detail.dart';
import 'package:tehno_mir/data/repositories/user_repository.dart';
import 'package:tehno_mir/domain/repositories/about_us_repository.dart';
import 'package:tehno_mir/domain/repositories/banner.dart';
import 'package:tehno_mir/domain/repositories/categories.dart';
import 'package:tehno_mir/domain/repositories/favorite_repository.dart';
import 'package:tehno_mir/domain/repositories/user_repository.dart';
import 'package:tehno_mir/domain/usecases/about_us/about_us_usecase.dart';
import 'package:tehno_mir/domain/usecases/banner/banner.dart';
import 'package:tehno_mir/domain/usecases/cart/get_cart_items.dart';
import 'package:tehno_mir/domain/usecases/cart/update_cart_item.dart';
import 'package:tehno_mir/domain/usecases/product_detail/get_product_detail.dart';
import 'package:tehno_mir/domain/usecases/user/get_user_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_in_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_out_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_up_usecase.dart';
import 'package:tehno_mir/presentation/bloc/about_us/about_us_cubit.dart';
import 'package:tehno_mir/presentation/bloc/auth/auth_bloc.dart';
import 'package:tehno_mir/presentation/bloc/banners/banner_cubit.dart';
import 'package:tehno_mir/presentation/bloc/cart/cart_bloc.dart';
import 'package:tehno_mir/presentation/bloc/cart/total_price/total_price_bloc.dart';
import 'package:tehno_mir/presentation/bloc/categories/category_cubit.dart';
import 'package:tehno_mir/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:tehno_mir/presentation/bloc/order/order_bloc.dart';
import 'package:tehno_mir/presentation/bloc/products/products_cubit.dart';
import 'package:tehno_mir/presentation/bloc/product_details/product_detail_bloc.dart';
import 'core/network/api_provider.dart';
import 'core/network/api_provider_impl.dart';
import 'core/network/network.dart';
import 'data/data_sources/local/local_datasource.dart';
import 'data/data_sources/remote/cart_remote_datasource.dart';
import 'data/data_sources/remote/products_remote_datasource.dart';
import 'data/repositories/about_us_repository.dart';
import 'data/repositories/cart_repository_impl.dart';
import 'data/repositories/order_repository.dart';
import 'data/repositories/products_repository.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/repositories/order_repository.dart';
import 'domain/repositories/product.dart';
import 'domain/repositories/product_detail_repository.dart';
import 'domain/usecases/cart/add_cart_item.dart';
import 'domain/usecases/cart/clear_cart.dart';
import 'domain/usecases/cart/get_total_cost.dart';
import 'domain/usecases/cart/remove_cart_item.dart';
import 'domain/usecases/category/categories_usecase.dart';
import 'domain/usecases/favorite/add_favorite.dart';
import 'domain/usecases/favorite/get_favorite.dart';
import 'domain/usecases/favorite/remove_favorite.dart';
import 'domain/usecases/order/get_order_history.dart';
import 'domain/usecases/order/get_order_preview.dart';
import 'domain/usecases/order/order_product.dart';
import 'domain/usecases/products/get_product_usecase.dart';
import 'domain/usecases/products/get_category_products_usecase.dart';
import 'domain/usecases/products/get_search_result.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  ///network
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker.createInstance());

  /// api provider
  locator.registerLazySingleton<ApiProvider>(() => ApiProviderImpl());

  ///data source
  locator.registerLazySingleton<BannerRemoteDataSource>(
    () => BannerRemoteDataSourceImpl(apiProvider: locator()),
  );
  locator.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(apiProvider: locator()),
  );
  locator.registerLazySingleton<ProductDetailRemoteDataSource>(
    () => ProductDetailRemoteDataSourceImpl(locator()),
  );

  locator.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(apiProvider: locator()),
  );
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<AboutUsRemoteDataSource>(
    () => AboutUsRemoteDataSourceImpl(apiProvider: locator()),
  );
  locator.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(locator()),
  );
  locator.registerLazySingleton<FavoriteRemoteDataSource>(
        () => FavoriteRemoteDataSourceImpl(locator()),
  );
  // locator.registerLazySingleton<LocalDataSource>(
  //         () => LocalDataSourceImpl());

  ///repository
  locator.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl(
        networkInfo: locator(),
        remoteDataSource: locator(),
//    localDataSource: locator(),
      ));

  locator
      .registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
            networkInfo: locator(),
            remoteDataSource: locator(),
          ));

  locator
      .registerLazySingleton<ProductsRepository>(() => ProductsRepositoryImpl(
            networkInfo: locator(),
            remoteDataSource: locator(),
          ));
  locator.registerLazySingleton<ProductDetailRepository>(() =>
      ProductDetailRepositoryImpl(
          networkInfo: locator(), remoteDataSource: locator()));

  locator.registerLazySingleton<UserRepository>(() =>
      UserRepositoryImpl(networkInfo: locator(), remoteDataSource: locator()));

  locator.registerLazySingleton<AboutUsRepository>(() => AboutUsRepositoryImpl(
      networkInfo: locator(), remoteDataSource: locator()));

  locator.registerLazySingleton<CartRepository>(() =>
      CartRepositoryImpl(networkInfo: locator(), remoteDataSource: locator()));
  locator.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(locator(), locator()));
  locator.registerLazySingleton<FavoriteRepository>(
          () => FavoriteRepositoryImpl(locator(), locator()));

  /// usecase
  locator.registerLazySingleton(() => GetBannerUseCase(repository: locator()));
  locator
      .registerLazySingleton(() => GetCategoryUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetCategoryProductsUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetProductDetailUseCase(repository: locator()));
  //locator.registerLazySingleton(() => GetAllProductsUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetSearchResultUseCase(repository: locator()));
  locator.registerLazySingleton(() => GetProductUseCase(repository: locator()));

  locator.registerLazySingleton(() => SignInUseCase(locator()));
  locator.registerLazySingleton(() => SignUpUseCase(locator()));
  locator.registerLazySingleton(() => SignOutUseCase(locator()));
  locator.registerLazySingleton(() => GetUserUseCase(locator()));
  locator.registerLazySingleton(() => GetAboutUsUseCase(repository: locator()));
  locator
      .registerLazySingleton(() => GetCartItemsUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => UpdateCartItemUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetTotalCostOfCartUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => RemoveCartItemUseCase(repository: locator()));
  locator.registerLazySingleton(() => ClearCartUseCase(repository: locator()));
  locator
      .registerLazySingleton(() => AddCartItemUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetOrderHistoryUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetOrderPreviewUseCase(repository: locator()));
  locator.registerLazySingleton(() => OrderProductCase(repository: locator()));
  locator.registerLazySingleton(() => AddFavoriteUseCase(repository: locator()));
  locator.registerLazySingleton(() => GetFavoriteUseCase(repository: locator()));
  locator.registerLazySingleton(() => RemoveFavoriteUseCase(repository: locator()));

  ///bloc
  locator.registerFactory(() => BannerCubit(locator()));

  locator.registerFactory(() => CategoryCubit(locator()));
  locator.registerFactory(() => CategoryProductsCubit(
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => ProductDetailBloc(locator()));
  locator.registerFactory(
    () => AuthBloc(locator(), locator(), locator(), locator()),
  );
  locator.registerFactory(() => AboutUsCubit(locator()));
  locator.registerFactory(
      () => CartBloc(locator(), locator(), locator(), locator(), locator()));
  locator.registerFactory(() => TotalPriceBloc(locator()));
  locator.registerFactory(() => OrderBloc(locator(), locator(), locator()));
  locator.registerFactory(() => FavoriteBloc(locator(), locator(), locator()));
}
