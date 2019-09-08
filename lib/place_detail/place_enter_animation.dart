import 'package:flutter/material.dart';

class PlaceEnterAnimation {
  final AnimationController animationController;
  final Animation<double> nameTranslationAnimation;
  final Animation<double> nameOpacityAnimation;
  final Animation<double> descTranslationAnimation;
  final Animation<double> descOpacityAnimation;
  final Animation<double> timeTranslationAnimation;
  final Animation<double> timeOpacityAnimation;
  final Animation<double> imageTranslationAnimation;
  final Animation<double> imageOpacityAnimation;

  PlaceEnterAnimation(this.animationController)
      : nameTranslationAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.0, 0.8))),
        nameOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.0, 0.8))),
        timeTranslationAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.3, 0.8))),
        timeOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.3, 0.8))),
        descTranslationAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.5, 0.8))),
        descOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.5, 0.8))),
        imageTranslationAnimation = Tween<double>(begin: 200, end: 0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.7, 1.0))),
        imageOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController, curve: Interval(0.7, 1.0)));
}
