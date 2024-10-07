import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kindergarten_app/src/constants/image_strings.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Stack(
            children: [
              TFadeInAnimation(
                  durationInMs: 1000,
                  animate: TAnimationPosition(
                      topBefore: -30,
                      topAfter: 200,
                      leftBefore: -30,
                      leftAfter: 30
                  ),
                  child: const Image(
                    image: AssetImage(tSplashImage),
                  )
              ),
              TFadeInAnimation(
                  durationInMs: 500,
                  animate: TAnimationPosition(
                      topBefore: -30,
                      topAfter: 30,
                      leftBefore: -30,
                      leftAfter: 30
                  ),
                  child: const Image(
                    image: AssetImage(tSplashLogo),
                  )
              ),

            ],
          ),
        )
    );
  }
}
