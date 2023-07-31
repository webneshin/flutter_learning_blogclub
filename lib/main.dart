import 'dart:ui';

import 'package:blog_club/article.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double bottomNavigationHeight = 65.0;

class Pages {
  static const int home = 0;
  static const int article = 1;
  static const int search = 2;
  static const int menu = 3;
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static const defaultFontFamily = "avenir";
  static const primaryTextColor = Color(0xff0D253C);
  static const secondaryTextColor = Color(0xff2D4379);
  static const primaryColor = Color(0xff376AED);

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          // elevation: 0,
          titleSpacing: 32,
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: primaryTextColor,
          background: Color(0xffFBFCFF),
          onBackground: primaryTextColor,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: defaultFontFamily)))),
        textTheme: const TextTheme(
            headlineSmall: TextStyle(
                color: primaryTextColor,
                fontFamily: defaultFontFamily,
                fontWeight: FontWeight.bold),
            titleMedium: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
            ),
            bodySmall: TextStyle(
                fontFamily: defaultFontFamily,
                color: secondaryTextColor,
                fontSize: 12)),
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       child: _BottomNavigation(),
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //     )
      //   ],
      // ),
      home: const MainScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = Pages.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: bottomNavigationHeight,
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                ),
                Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => ArticleScreen(),
                  ),
                ),
                Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                ),
                Navigator(
                  onGenerateRoute: (settings) => MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                ),
                // const HomeScreen(),
                // const ArticleScreen(),
                // const SearchScreen(),
                // const ProfileScreen(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: _BottomNavigation(
              onTap: (index) {
                setState(() {
                  selectedScreenIndex = index;
                });
              },
              selectedIndex: selectedScreenIndex,
            ),
          )
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Search Screen",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const _BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: bottomNavigationHeight,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9B8487).withOpacity(0.3))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    icon: Icons.home,
                    active: selectedIndex == Pages.home,
                    name: "Home",
                    onTap: () {
                      onTap(Pages.home);
                    },
                  ),
                  _BottomNavigationItem(
                    icon: Icons.menu_book,
                    active: selectedIndex == Pages.article,
                    name: "Article",
                    onTap: () {
                      onTap(Pages.article);
                    },
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  _BottomNavigationItem(
                    icon: Icons.search,
                    active: selectedIndex == Pages.search,
                    name: "Search",
                    onTap: () {
                      onTap(Pages.search);
                    },
                  ),
                  _BottomNavigationItem(
                    icon: Icons.menu,
                    active: selectedIndex == Pages.menu,
                    name: "Menu",
                    onTap: () {
                      onTap(Pages.menu);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 55,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 4,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    color: const Color(0xff376AED),
                    borderRadius: BorderRadius.circular(55 / 2)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white70,
                  size: 36,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final bool active;
  final String name;
  final Function() onTap;

  const _BottomNavigationItem(
      {super.key,
      required this.icon,
      required this.active,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = active ? Colors.blue : Colors.grey;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 28,
              color: color,
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: Theme.of(context).textTheme.bodySmall?.apply(color: color),
            )
          ],
        ),
      ),
    );
  }
}
