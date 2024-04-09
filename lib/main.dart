import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tehno_mir/app.dart';
import 'package:tehno_mir/presentation/bloc/auth/auth_bloc.dart';
import 'package:tehno_mir/presentation/bloc/banners/banner_cubit.dart';
import 'package:tehno_mir/presentation/bloc/categories/category_cubit.dart';
import 'package:tehno_mir/presentation/bloc/products/products_cubit.dart';
import 'package:tehno_mir/presentation/bloc/product_details/product_detail_bloc.dart';
import 'package:tehno_mir/presentation/bloc/user/user_bloc.dart';
import 'core/config/theme/app_theme.dart';
import 'core/local/token_store.dart';
import 'locator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Store.initialize();
  await initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BannerCubit>(
          create: (context) => locator<BannerCubit>()),
      BlocProvider<CategoryCubit>(
          create: (context) => locator<CategoryCubit>()),
      BlocProvider<CategoryProductsCubit>(
          create: (context) => locator<CategoryProductsCubit>()),
      BlocProvider<ProductDetailBloc>(
          create: (context) => locator<ProductDetailBloc>()),
      BlocProvider<AuthBloc>(
          create: (context) => locator<AuthBloc>()..add(CheckAuthEvent())),
      BlocProvider<UserBloc>(
          create: (context) => locator<UserBloc>()),
    ], child: MaterialApp(
        title: 'Open Flutter E-commerce',
        theme: AppTheme.light(),
        home:  AppStart()
    ),);
  }
}





