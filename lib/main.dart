import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/app.dart';
import 'package:tehno_mir/core/config/route/route_names.dart';
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
import 'package:tehno_mir/presentation/bloc/user/user_bloc.dart';
import 'package:tehno_mir/presentation/pages/splash_screen/view/splash_page.dart';
import 'core/config/route/router.dart';
import 'core/config/theme/app_theme.dart';
import 'core/local/token_store.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Store.initialize();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BannerCubit>(create: (context) => locator<BannerCubit>()),
        BlocProvider<CategoryCubit>(
            create: (context) => locator<CategoryCubit>()),
        BlocProvider<CategoryProductsCubit>(
            create: (context) => locator<CategoryProductsCubit>()),
        BlocProvider<ProductDetailBloc>(
            create: (context) => locator<ProductDetailBloc>()),
        BlocProvider<AuthBloc>(
          create: (context) => locator<AuthBloc>()..add(CheckAuthEvent()),
          lazy: false,
        ),
        BlocProvider<AboutUsCubit>(
            create: (context) => locator<AboutUsCubit>()),
        BlocProvider<CartBloc>(create: (context) => locator<CartBloc>()),
        BlocProvider<TotalPriceBloc>(
            create: (context) => locator<TotalPriceBloc>()),
        BlocProvider<OrderBloc>(create: (context) => locator<OrderBloc>()),
        BlocProvider<FavoriteBloc>(
            create: (context) =>
                locator<FavoriteBloc>()..add(GetFavoriteProducts())),
      ],
      child: MaterialApp(
          title: 'Open Flutter E-commerce',
          theme: AppTheme.light(),

        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: RouteNames.splashRoute,
     //     home: SplashView(),//AppStart()
      ),
    );
  }
}
