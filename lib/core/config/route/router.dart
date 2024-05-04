import 'package:flutter/material.dart';
import 'package:tehno_mir/app.dart';
import 'package:tehno_mir/core/config/route/route_names.dart';
import 'package:tehno_mir/presentation/pages/cart/page/cart_page.dart';
import 'package:tehno_mir/presentation/pages/categories/view/category_page.dart';
import 'package:tehno_mir/presentation/pages/favorites/favorites_page.dart';
import 'package:tehno_mir/presentation/pages/home/home_page.dart';
import 'package:tehno_mir/presentation/pages/product_details/product_details_page.dart';
import 'package:tehno_mir/presentation/pages/products/products_page.dart';
import 'package:tehno_mir/presentation/pages/profile/about_us/about_us_page.dart';
import 'package:tehno_mir/presentation/pages/profile/addresses/address_page.dart';
import 'package:tehno_mir/presentation/pages/profile/contact_us/contact_us_page.dart';
import 'package:tehno_mir/presentation/pages/profile/history/history_page.dart';
import 'package:tehno_mir/presentation/pages/profile/profile_page.dart';
import 'package:tehno_mir/presentation/pages/registration/sign_in/sign_in_page.dart';
import 'package:tehno_mir/presentation/pages/registration/sign_up/registration_page.dart';
import 'package:tehno_mir/presentation/pages/splash_screen/view/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteNames.appStartRoute:
        return MaterialPageRoute(builder: (_) => AppStart());
      case RouteNames.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteNames.categoryRoute:
        return MaterialPageRoute(builder: (_) => const CategoryPage());
      case RouteNames.favouritesRoute:
        return MaterialPageRoute(builder: (_) => const FavoritePage());
      case RouteNames.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case RouteNames.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RouteNames.productDetailRoute:
        final id = routeSettings.arguments as int;

        return MaterialPageRoute(
            builder: (_) => ProductDetailsPage(productId: id));
      case RouteNames.categoryProductsRoute:
        final id = routeSettings.arguments as int;

        return MaterialPageRoute(builder: (_) => ProductsPage(categoryId: id));
      case RouteNames.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegistrationPage());

      case RouteNames.loginRoute:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteNames.historyRoute:
        return MaterialPageRoute(builder: (_) => const HistoryPage());
      case RouteNames.addressRoute:
        return MaterialPageRoute(builder: (_) => const AddressPage());
      case RouteNames.contactUsRoute:
        return MaterialPageRoute(builder: (_) => const ContactUsPage());
      case RouteNames.aboutUs:
        return MaterialPageRoute(builder: (_) => const AboutUsPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Bu sahypa tapylmady'), //.tr(),
            ),
            body: const Center(
              child: Text('Bu sahypa tapylmady'), //.tr()),
            )));
  }
}
