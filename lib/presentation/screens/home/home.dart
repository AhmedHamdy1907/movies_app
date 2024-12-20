import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/presentation/screens/home/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/home_tab.dart';
import 'package:movies_app/presentation/screens/home/tabs/search_tab/search_tab.dart';
import 'package:movies_app/presentation/screens/home/tabs/watchList_tab/watchList_tab.dart';

import '../../../core/utils/assets_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.home),),
                  label: 'HOME'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.search)),
                  label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(AssetsManager.browse)),
                  label: 'BROWSE'),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AssetsManager.watchList)),
                label: 'WATCHLIST',
              ),
            ]),
        body: tabs[selectedIndex],
      ),
    );
  }
}
