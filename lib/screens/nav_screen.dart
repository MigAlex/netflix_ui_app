import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

import 'home.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    Home(key: PageStorageKey('home')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
          create: (_) => AppBarCubit(), child: _screens[_currentIndex]),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons
                  .map(
                    (title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(icon, size: 30),
                        label: title,
                      ),
                    ),
                  )
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              unselectedItemColor: Colors.grey,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}
