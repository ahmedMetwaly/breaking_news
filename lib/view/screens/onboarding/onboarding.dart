// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:breaking_news/resources/image_manager.dart';
import 'package:breaking_news/resources/values_manager.dart';

import '../../../generated/l10n.dart';
import '../../../resources/routes.dart';
import '../../../services/sharedprefrences_service/sharedprefrences_service.dart';
import 'widgets/onboarding_button.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    late GifController gifController1;
    gifController1 = GifController(
        onFrame: (value) => value == 24 ? gifController1.pause() : null);
    late GifController gifController2;
    gifController2 = GifController(
        onFrame: (value) => value == 24 ? gifController2.pause() : null);
    late GifController gifController3;
    gifController3 = GifController(
        onFrame: (value) => value == 24 ? gifController3.pause() : null);

    List<PageViewModel> pages = [
      PageViewModel(
        title: S.current.onboarding1Title,
        body: S.current.onboarding1Body,
        image: GifView.asset(
                  ImageManager.onboarding1,
                  controller: gifController1,
                  height: 300,
                  width: 300,
                  frameRate: 30, // default is 15 FPS
                ),
      ),
      PageViewModel(
        title: S.current.onboarding2Title,
        body: S.current.onboarding2Body,
        image: GifView.asset(
                  ImageManager.onboarding2,
                  controller: gifController2,
                  matchTextDirection: true,
                  height: 300,
                  width: 300,
                  frameRate: 30, // default is 15 FPS
                ),
      ),
      PageViewModel(
        title: S.current.onboarding3Title,
        body: S.current.onboarding3Body,
        image: GifView.asset(
                  ImageManager.onboarding3,
                  controller: gifController3,
                  matchTextDirection: true,
                  height: 300,
                  width: 300,
                  frameRate: 30, // default is 15 FPS
                ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          bodyPadding: const EdgeInsets.all(PaddingManager.pMainPadding),
          showSkipButton: true,
          curve: Curves.bounceInOut,
          onSkip: () async {
            await SharedPrefrencesService.addBoolToSF("isOpenedBefore", true);
            Navigator.of(context).pushReplacementNamed(Routes.logIn);
          },
          onDone: () async {
            await SharedPrefrencesService.addBoolToSF("isOpenedBefore", true);
            Navigator.of(context).pushReplacementNamed(Routes.logIn);
          },
          skip: OnBoardingButton(title: S.current.skip),
          next: const Icon(Icons.arrow_forward),
          done: OnBoardingButton(title: S.current.done),
          pages: pages,
        ),
      ),
    );
  }
}
