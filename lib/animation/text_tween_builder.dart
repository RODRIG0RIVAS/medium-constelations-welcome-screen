import 'package:flutter/material.dart';

/// Classe abstrata para facilitar a utilização e manutenibilidade do código
abstract class TextTweenBuilder {
  Animation<Offset> call({
    required Interval interval, //intervalo da animação
    required double firstPositionOffsetValue, //posição inicial da animação
    required AnimationController animationController, //o controle da animação
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
