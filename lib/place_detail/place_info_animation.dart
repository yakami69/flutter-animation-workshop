import 'package:flutter/animation.dart';

class PlaceInfoAnimation {
  final AnimationController controller;
  final Animation<double> containerShowAnimation;
  final Animation<double> timeShowAnimation;
  final Animation<double> detailShowAnimation;

  PlaceInfoAnimation(this.controller)
      : containerShowAnimation =
            Tween<double>(begin: 1, end: 0.4).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.8),
        )),
        timeShowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(curve: Interval(0.8, 1.0), parent: controller)),
        detailShowAnimation =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.4, 0.8),
        ));
}
