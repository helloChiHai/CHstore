import 'package:chstore/ui/homePage/showProductPage.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    ShowProductPage(),
    Container(color: Colors.green, child: Center(child: Text('Search'))),
    Container(color: Colors.orange, child: Center(child: Text('Cart'))),
    Container(color: Colors.red, child: Center(child: Text('Settings'))),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: PersistentTabView(
        context,
        controller: PersistentTabController(initialIndex: _selectedIndex),
        screens: screens,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: 'Home',
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.search),
            title: 'Search',
            activeColorPrimary: Colors.green,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: 'Like',
            activeColorPrimary: Colors.orange,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.settings),
            title: 'Settings',
            activeColorPrimary: Colors.red,
            inactiveColorPrimary: Colors.grey,
          ),
        ],
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        // Chọn kiểu navbar này
        navBarStyle: NavBarStyle.neumorphic,
      ),
    );
  }
}
