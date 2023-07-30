import 'package:blog_club/auth.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'gen/assets.gen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Container(
                height: 260,
                decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20, color: Colors.black.withOpacity(0.1))
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                child: Column(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      itemCount: items.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].title,
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                items[index].description,
                                style: theme.textTheme.titleMedium,
                              )
                            ],
                          ),
                        );
                      },
                    )),
                    Container(
                      height: 60,
                      padding:
                          const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: items.length,
                            effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor:
                                  theme.colorScheme.primary.withOpacity(0.1),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (page + 1 == items.length) {
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => const AuthScreen(),
                                  ));
                                } else {
                                  _pageController.animateToPage(page + 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.decelerate);
                                }
                              },
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(88, 60)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)))),
                              child: page + 1 == items.length
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.arrow_forward))
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
