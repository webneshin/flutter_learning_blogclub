import 'dart:ui';

import 'package:blog_club/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static const defaultFontFamily = "avenir";
  static const primaryTextColor = Color(0xff0D253C);
  static const secondaryTextColor = Color(0xff2D4379);

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
      home: const HomeScreen(),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, webneshin!',
                      style: theme.textTheme.titleMedium,
                    ),
                    const Badge(
                      textStyle: TextStyle(fontSize: 8),
                      label: Text("1"),
                      backgroundColor: Colors.deepOrange,
                      child: Icon(Icons.notifications_outlined),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  "Explore Today's",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              _StoryList(stories: stories, theme: theme),
              SizedBox(
                height: 16,
              ),
              _CategoryList()
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          category: categories[realIndex],
        );
      },
      options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          // padEnds: false,
          scrollPhysics: BouncingScrollPhysics(),
          disableCenter: true,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          // enlargeFactor: 0.4,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;

  const _CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 24,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
              ]),
            )),
        Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 32),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(32)),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: const LinearGradient(
                  colors: [Color(0xff0D253C), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
                'assets/img/posts/large/${category.imageFileName}',
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 42,
          left: 32,
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: Colors.white,
                  fontSizeFactor: 0.8,
                ),
          ),
        )
      ],
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
    required this.theme,
  });

  final List<StoryData> stories;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story, theme: theme);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
    required this.theme,
  });

  final StoryData story;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${story.iconFileName}',
                    width: 24,
                    height: 24,
                  ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            story.name,
            style: theme.textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ], begin: Alignment.topLeft)),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: Color(0xff7B8BB2),
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        dashPattern: const [8, 3],
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}
