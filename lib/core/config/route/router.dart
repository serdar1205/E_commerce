// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:tehno_mir/core/config/route/route_names.dart';
// import 'package:tehno_mir/presentation/pages/cart/order_page.dart';
// import 'package:tehno_mir/presentation/pages/cart/page/cart_page.dart';
// import 'package:tehno_mir/presentation/pages/home/home_page.dart';
// import 'package:tehno_mir/presentation/pages/product_details/product_details_page.dart';
// import 'package:tehno_mir/presentation/pages/products/products_page.dart';
// import 'package:tehno_mir/presentation/pages/profile/addresses/address_page.dart';
// import 'package:tehno_mir/presentation/pages/profile/contact_us/contact_us_page.dart';
// import 'package:tehno_mir/presentation/pages/profile/favorite/favorites_page.dart';
// import 'package:tehno_mir/presentation/pages/profile/profile_page.dart';
// import 'package:tehno_mir/presentation/pages/registration/sign_up/registration_page.dart';
// import 'package:tehno_mir/presentation/pages/search/view/search_page.dart';
// import 'package:tehno_mir/presentation/widgets/bottom_navigation.dart';
//
// // Create keys for `root` & `section` navigator avoiding unnecessary rebuilds
// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _sectionNavigatorKey = GlobalKey<NavigatorState>();
//
//
// final router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   initialLocation: RouteNames.mainPage,
//   routes: <RouteBase>[
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) {
//         // Return the widget that implements the custom shell (e.g a BottomNavigationBar).
//         // The [StatefulNavigationShell] is passed to be able to navigate to other branches in a stateful way.
//         return ScaffoldWithNavbar(navigationShell);
//       },
//       branches: [
//         // The route branch for the 1º Tab
//         StatefulShellBranch(
//           navigatorKey: _sectionNavigatorKey,
//           // Add this branch routes
//           // each routes with its sub routes if available e.g feed/uuid/details
//           routes: <RouteBase>[
//             GoRoute(
//               path: RouteNames.mainPage,
//               builder: (context, state) => const HomePage(),
//               routes: <RouteBase>[
//                 GoRoute(
//                   path: RouteNames.productList,
//                   builder: (context, state) => const ProductsPage(),
//                 )
//               ],
//             ),
//           ],
//         ),
//
//         // The route branch for 2º Tab
//         StatefulShellBranch(routes: <RouteBase>[
//           // Add this branch routes
//           // each routes with its sub routes if available e.g shope/uuid/details
//           GoRoute(
//             path: RouteNames.search,
//             builder: (context, state) => const SearchPage(),
//             routes: <RouteBase>[
//               GoRoute(path: RouteNames.productDetail,
//               builder: (context, state) => const ProductDetailsPage()),
//             ]
//           ),
//
//         ]),
//
//         StatefulShellBranch(routes: <RouteBase>[
//           // Add this branch routes
//           // each routes with its sub routes if available e.g shope/uuid/details
//           GoRoute(
//             path: RouteNames.cart,
//             builder: (context, state) => const CartPage(),
//               routes: <RouteBase>[
//                 GoRoute(path: RouteNames.order,
//                     builder: (context, state) => const OrderPage()),
//               ]
//           ),
//         ]),
//         StatefulShellBranch(routes: <RouteBase>[
//           // Add this branch routes
//           // each routes with its sub routes if available e.g shope/uuid/details
//           GoRoute(
//             path: RouteNames.profile,
//             builder: (context, state) =>  const ProfilePage(),
//             routes:  <RouteBase>[
//               GoRoute(
//                   path: RouteNames.signup,
//                   builder: (context, state) => const RegistrationPage()),
//               GoRoute(
//                   path: RouteNames.favourites,
//                   builder: (context, state) => const FavoritePage()),
//               GoRoute(
//                   path: RouteNames.address,
//                   builder: (context, state) => const AddressPage()),
//               GoRoute(
//                   path: RouteNames.contuctUs,
//                   builder: (context, state) => const ContactUsPage()),
//
//             ]
//           ),
//         ])
//       ],
//     ),
//   ],
// );