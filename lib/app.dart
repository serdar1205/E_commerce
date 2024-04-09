import 'package:flutter/material.dart';
import 'package:tehno_mir/presentation/pages/cart/page/cart_page.dart';
import 'package:tehno_mir/presentation/pages/home/home_page.dart';
import 'package:tehno_mir/presentation/pages/profile/profile_page.dart';
import 'package:tehno_mir/presentation/pages/search/view/search_page.dart';
import 'core/utilities/global_data.dart';
import 'presentation/widgets/app_bar.dart';
import 'presentation/widgets/bottom_navigation.dart';

class AppStart extends StatelessWidget {
  AppStart({super.key});

  final List<Widget> pages = [
     const HomePage(),
    const SearchPage(),
    const CartPage(),
     const ProfilePage(),
  ];


  final List appBars =[
    const CustomAppBarWidget(index: 0),
    AppBar(title: const Text('Kategoriyalar')),
    AppBar(title: const Text('Sebet')),
    AppBar(title: const Text('Profil')),
  ];
  final ValueNotifier<int> _pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    GlobalData.homeContext = context;
    return ValueListenableBuilder(valueListenable: _pageIndexNotifier,
        builder: (BuildContext context, int index, Widget? child) {
          return Scaffold(
            appBar: appBars[index],
            body: pages[index],
            bottomNavigationBar: BottomNavBar(
              pageIndexNotifier: _pageIndexNotifier,),
          );
        });
  }
}
