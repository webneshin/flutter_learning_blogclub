import 'package:blog_club/data.dart';
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
      home: HomeScreen(),
    );
  }
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
                padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, webneshin!',
                      style: theme.textTheme.titleMedium,
                    ),
                    Badge(
                      textStyle: TextStyle(fontSize: 8),
                      label: Text("1"),
                      backgroundColor: Colors.deepOrange,
                      child: Icon(Icons.notifications_outlined),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  "Explore Today's",
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 90,
                child: ListView.builder(
                    itemCount: stories.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    itemBuilder: (context, index) {
                      final story = stories[index];
                      return Container(
                        margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
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
                                    margin: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    padding: EdgeInsets.all(4),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                            'assets/img/stories/${story.imageFileName}')),
                                  ),
                                ),
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
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              story.name,
                              style: theme.textTheme.bodySmall,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
