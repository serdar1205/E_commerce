import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tehno_mir/data/data_sources/remote/banner_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/category_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/product_detail_remote_datasource.dart';
import 'package:tehno_mir/data/data_sources/remote/user_remote_datasource.dart';
import 'package:tehno_mir/data/repositories/banner_repository.dart';
import 'package:tehno_mir/data/repositories/category_repository.dart';
import 'package:tehno_mir/data/repositories/product_detail.dart';
import 'package:tehno_mir/data/repositories/user_repository.dart';
import 'package:tehno_mir/domain/repositories/banner.dart';
import 'package:tehno_mir/domain/repositories/categories.dart';
import 'package:tehno_mir/domain/repositories/user_repository.dart';
import 'package:tehno_mir/domain/usecases/banner/banner.dart';
import 'package:tehno_mir/domain/usecases/product_detail/get_product_detail.dart';
import 'package:tehno_mir/domain/usecases/products/get_all_products.dart';
import 'package:tehno_mir/domain/usecases/user/get_user_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_in_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_out_usecase.dart';
import 'package:tehno_mir/domain/usecases/user/sign_up_usecase.dart';
import 'package:tehno_mir/presentation/bloc/auth/auth_bloc.dart';
import 'package:tehno_mir/presentation/bloc/banners/banner_cubit.dart';
import 'package:tehno_mir/presentation/bloc/categories/category_cubit.dart';
import 'package:tehno_mir/presentation/bloc/products/products_cubit.dart';
import 'package:tehno_mir/presentation/bloc/product_details/product_detail_bloc.dart';
import 'package:tehno_mir/presentation/bloc/user/user_bloc.dart';
import 'core/network/api_provider.dart';
import 'core/network/api_provider_impl.dart';
import 'core/network/network.dart';
import 'data/data_sources/remote/products_remote_datasource.dart';
import 'data/repositories/products_repository.dart';
import 'domain/repositories/product.dart';
import 'domain/repositories/product_detail_repository.dart';
import 'domain/usecases/category/categories_usecase.dart';
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
    () => UserRemoteDataSourceImpl( locator()),
  );

  ///repository
  locator.registerLazySingleton<BannerRepository>(() => BannerRepositoryImpl(
        networkInfo: locator(),
        remoteDataSource: locator(),
      ));

  locator
      .registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
            networkInfo: locator(),
            remoteDataSource: locator(),
          ));

  locator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(
            networkInfo: locator(),
            remoteDataSource: locator(),
          ));
  locator.registerLazySingleton<ProductDetailRepository>(() =>
      ProductDetailRepositoryImpl(
          networkInfo: locator(), remoteDataSource: locator()));

  locator.registerLazySingleton<UserRepository>(() =>
      UserRepositoryImpl(
          networkInfo: locator(), remoteDataSource: locator()));


  /// usecase
  locator.registerLazySingleton(() => GetBannerUseCase(repository: locator()));
  locator
      .registerLazySingleton(() => GetCategoryUseCase(repository: locator()));
  locator.registerLazySingleton(
      () => GetCategoryProductsUseCase(repository: locator()));
  locator.registerLazySingleton(() => GetProductDetailUseCase(repository: locator()));
  //locator.registerLazySingleton(() => GetAllProductsUseCase(repository: locator()));
  locator.registerLazySingleton(() => GetSearchResultUseCase(repository: locator()));
  locator.registerLazySingleton(() => GetProductUseCase(repository: locator()));

  locator.registerLazySingleton(() => SignInUseCase( locator()));
  locator.registerLazySingleton(() => SignUpUseCase( locator()));
  locator.registerLazySingleton(() => SignOutUseCase( locator()));
  locator.registerLazySingleton(() => GetUserUseCase( locator()));




  ///bloc
  locator.registerFactory(() => BannerCubit(locator()));

  locator.registerFactory(() => CategoryCubit(locator()));
  locator.registerFactory(() => CategoryProductsCubit(locator(), locator(), locator(),));
  locator.registerFactory(() => ProductDetailBloc(locator()));
  locator.registerFactory(() => AuthBloc(locator(),locator(),locator()));
  locator.registerFactory(() => UserBloc(locator()));
}
