import 'package:flutter/material.dart';

abstract class TextTweenBuilder {
  Animation<Offset> call({
    required Interval interval,
    required double firstPositionOffsetValue,
    required AnimationController animationController,
  });
}

class TextTweenBuilderImpl implements TextTweenBuilder {
  @override
  Animation<Offset> call({
    required Interval interval,
    required double firstPositionOffsetValue,
    required AnimationController animationController,
  }) {
    return Tween<Offset>(
      begin: Offset(firstPositionOffsetValue, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: interval,
      ),
    );
  }
}
