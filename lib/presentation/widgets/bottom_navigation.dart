import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tehno_mir/core/constants/colors/app_colors.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key, required this.pageIndexNotifier}) : super(key: key);

  final ValueNotifier<int> pageIndexNotifier;

  final List<String> pageTitles = ['Bas sahypa', 'Kategoriyalar', 'Sebet', 'Profile'];

  final List<String> pageIcons = [
    'Home.svg',
    'category.svg',
    'basket.svg',
    'Profile.svg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3, left: 2),
      child: ValueListenableBuilder<int>(
        valueListenable: pageIndexNotifier,
        builder: (context, pageIndex, _) {
          return BottomNavigationBar(
            items: List.generate(
              pageTitles.length,
              (index) => BottomNavigationBarItem(
                icon: pageIndex == index
                    ? SvgPicture.asset(
                        'assets/icons/${pageIcons[index]}',
                        height: 24,
                        width: 24,
                        color: AppColors.curnil,
                      )
                    : SvgPicture.asset(
                        'assets/icons/${pageIcons[index]}',
                        height: 24,
                        width: 24,
                      ),
                label: pageTitles[index],
              ),
            ),
            type: BottomNavigationBarType.fixed,
            currentIndex: pageIndex,
            onTap: (value) {
              pageIndexNotifier.value = value;
            },
            fixedColor:AppColors.curnil,
          );
        },
      ),
    );
  }
}

// class ScaffoldWithNavbar extends StatelessWidget {
//   const ScaffoldWithNavbar(this.navigationShell, {super.key});
//
//   /// The navigation shell and container for the branch Navigators.
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: navigationShell.currentIndex,
//         items:  [
//           BottomNavigationBarItem(icon: SvgPicture.asset(
//             'assets/icons/Home.svg',
//             height: 24,
//             width: 24,
//           ), label: 'Bas sahypa'),
//           BottomNavigationBarItem(icon: SvgPicture.asset(
//             'assets/icons/search.svg',
//             height: 24,
//             width: 24,
//           ), label: 'Gozleg'),
//           BottomNavigationBarItem(icon: SvgPicture.asset(
//             'assets/icons/basket.svg',
//             height: 24,
//             width: 24,
//           ), label: 'Sebet'),
//           BottomNavigationBarItem(icon: SvgPicture.asset(
//             'assets/icons/Profile.svg',
//             height: 24,
//             width: 24,
//           ), label: 'Profile'),
//
//         ],
//         //type: BottomNavigationBarType.fixed,
//         //fixedColor:AppColors.curnil,
//         onTap: _onTap,
//       ),
//     );
//   }
//
//   void _onTap(index) {
//     navigationShell.goBranch(
//       index,
//       // A common pattern when using bottom navigation bars is to support
//       // navigating to the initial location when tapping the item that is
//       // already active. This example demonstrates how to support this behavior,
//       // using the initialLocation parameter of goBranch.
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
// }