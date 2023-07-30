import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black26,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnakBar(context, theme, "Show snakbar!");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 8,
              ),
              Text(
                "2.1K",
                style:
                    TextStyle(fontSize: 16, color: theme.colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          CustomScrollView(

            slivers: [
              SliverAppBar(
                // pinned: true,
                // floating: true,
                title: const Text("Article"),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                      )),
                  const SizedBox(width: 16),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text("Four Things Every Woman Needs To Know.",
                        style: theme.textTheme.headlineSmall),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9
                              .image(width: 48, height: 48, fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Richard Gervain"),
                              SizedBox(
                                height: 4,
                              ),
                              Text("2m ago"),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                            showSnakBar(context, theme, "click on bookmark");
                          },
                          icon: const Icon(Icons.bookmark_border),
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        IconButton(
                          onPressed: () {
                            showSnakBar(context, theme, "click on share");
                          },
                          icon: const Icon(Icons.share),
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32)),
                      child: Assets.img.background.singlePost.image()),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                    child: Text(
                      "A man's sexuality is never your mind responsibility.",
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 8, 32, 32),
                    child: Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),

                ]),
                // crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(width: MediaQuery.of(context).size.width,height: 116,decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  theme.colorScheme.surface,
                  theme.colorScheme.surface.withOpacity(0),

                ]
              )
            ),),
          ),
        ],
      ),
    );
  }

  void showSnakBar(BuildContext context, ThemeData theme, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.thumb_up,
            color: theme.colorScheme.onPrimary,
          ),
          SizedBox(
            width: 8,
          ),
          Text(message),
        ],
      ),
      // behavior: SnackBarBehavior.floating,
    ));
  }
}
