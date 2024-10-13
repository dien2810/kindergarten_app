import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMs,
    this.animate,
    required this.child
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimationPosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>AnimatedPositioned(
        top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left: controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: controller.animate.value ? animate!.bottomAfter : animate!.bottomBefore,
        right: controller.animate.value ? animate!.rightAfter : animate!.rightBefore,
        duration: Duration(milliseconds: durationInMs),
        child: AnimatedOpacity(
            opacity: controller.animate.value ? 1 : 0,
            duration: Duration(milliseconds: durationInMs),
            child: child
        )
    ),
    );
  }
}