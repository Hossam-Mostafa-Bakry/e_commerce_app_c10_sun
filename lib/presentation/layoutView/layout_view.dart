import 'package:e_commerce_app_c10_sun/core/extenions/padding_ext.dart';
import 'package:e_commerce_app_c10_sun/presentation/category/pages/category_view.dart';
import 'package:flutter/material.dart';

import '../account/pages/account.dart';
import '../category_men/pages/category.dart';
import '../home/pages/home_view.dart';
import '../wishlist/pages/wish_list.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeView(),
    const CategoryView(),
    const WishList(),
    const Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        leading: Image.asset(
          'assets/images/route_logo.png',
          color: const Color(0xFF004182),
        ).setHorizontalPadding(context, 0.02),
        backgroundColor: Colors.transparent,
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: const Color(0xFF004182),
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage('assets/images/home.png'),
              ),
              label: "Home",
              activeIcon: Image.asset('assets/images/select_home.png'),
            ),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/menu.png')),
                label: "menu",
                activeIcon: Image.asset('assets/images/select_category.png')),
            BottomNavigationBarItem(
                icon:
                    const ImageIcon(AssetImage('assets/images/faviourte.png')),
                label: "favorite",
                activeIcon: Image.asset('assets/images/select_fav.png')),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/profile.png')),
                label: "profile",
                activeIcon: Image.asset('assets/images/select_pro.png')),
          ],
        ),
      ),

      body: screens[currentIndex],
      //   ],
      // ),
    );
  }
}
