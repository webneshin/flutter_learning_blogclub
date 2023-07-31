import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.background.withOpacity(0),
        title: Text("Profile"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color:
                              theme.colorScheme.onBackground.withOpacity(0.05)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                              child: Assets.img.stories.story8
                                  .image(width: 84, height: 84),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("@webneshin"),
                                  Text(
                                    "Sajjad Ebrahimi",
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    "Backend Developer",
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                        child: Text(
                          "About me",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          "Sweet chili soup is just not the same without butterscotch and ripe ground avocados.",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  )),
              Positioned(
                bottom: 0,
                right: 64,
                left: 64,
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff2151CD),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "52",
                                style: theme.textTheme.titleLarge!
                                    .copyWith(color: theme.colorScheme.onPrimary),
                              ),
                              SizedBox(height: 4,),
                              Text(
                                "Post",
                                style: theme.textTheme.bodyMedium!
                                    .copyWith(color: theme.colorScheme.onPrimary),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "250",
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: theme.colorScheme.onPrimary),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "Following",
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(color: theme.colorScheme.onPrimary),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4.5K",
                              style: theme.textTheme.titleLarge!
                                  .copyWith(color: theme.colorScheme.onPrimary),
                            ),
                            SizedBox(height: 4,),
                            Text(
                              "Followers",
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(color: theme.colorScheme.onPrimary),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
