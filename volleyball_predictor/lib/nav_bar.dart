import 'package:flutter/material.dart';
import 'team_selection_page.dart';
import 'stats_page.dart';
import 'settings_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  BottomNavBar({required this.selectedIndex});

  Route createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        if (index == selectedIndex) return;

        Widget nextPage;

        if (index == 0) {
          nextPage = TeamSelectionPage();
        } else if (index == 1) {
          nextPage = StatsPage();
        } else {
          nextPage = SettingsPage();
        }

        Navigator.pushReplacement(
          context,
          createPageRoute(nextPage),
        );
      },
    );
  }
}
