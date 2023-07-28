import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32,bottom: 32),
              child: Assets.img.background.onboarding.image(),
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
    );
  }

}