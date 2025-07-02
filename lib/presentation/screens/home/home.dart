import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/presentation/screens/home/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/presentation/screens/home/tabs/home_tab/home_tab.dart';
import 'package:movies_app/presentation/screens/home/tabs/search_tab/search_tab.dart';
import 'package:movies_app/presentation/screens/home/tabs/watchList_tab/watchList_tab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              // Static navigation - no state changes
            },
            currentIndex: 0, // Always show first tab
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.browse_gallery),
                  label: 'BROWSE'),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'WATCHLIST',
              ),
            ]),
        body: const HomeTab(), // Always show HomeTab
      ),
    );
  }
}
