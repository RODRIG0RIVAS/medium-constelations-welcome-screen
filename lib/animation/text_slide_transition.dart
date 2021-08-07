import 'package:flutter/material.dart';

/// Classe abstrata para facilitar a utilização e manutenibilidade do código
abstract class TextSlideTransition {
  SlideTransition call({
    required Animation<Offset> position, //a animação da posição
    required String text,
  });
}

class TextSlideTransitionImpl implements TextSlideTransition {
  @override
  SlideTransition call({
    required Animation<Offset> position,
    required String text,
  }) {
    final style = TextStyle(fontSize: 36.0, color: Colors.white);

    return SlideTransition(
      position: position,
      child: Text(text, style: style),
    );
  }
}
