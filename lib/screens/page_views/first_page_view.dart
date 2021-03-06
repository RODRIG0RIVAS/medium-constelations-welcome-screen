import 'package:constelations_welcome_screen/animation/text_slide_transition.dart';
import 'package:constelations_welcome_screen/animation/text_tween_builder.dart';
import 'package:constelations_welcome_screen/strings/first_page_strings.dart';
import 'package:flutter/material.dart';

class FirstPageView extends StatefulWidget {
  const FirstPageView({Key? key}) : super(key: key);

  @override
  _FirstPageViewState createState() => _FirstPageViewState();
}

class _FirstPageViewState extends State<FirstPageView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  /// Animations
  late Animation<Offset> firstTextAnimation;
  late Animation<Offset> secondTextAnimation;
  late Animation<Offset> thirdTextAnimation;
  late Animation<Offset> fourthTextAnimation;
  late Animation<Offset> fifthTextAnimation;
  late Animation<Offset> sixthTextAnimation;

  final image = AssetImage('assets/images/welcome_first.jpg');

  final buildTextSlideTransition = TextSlideTransitionImpl();

  /// Aqui aparece a implementação de que o Interval pode ir de 0.0 até 1.0
  /// Contudo, ele não precisa ir até 1.0, apenas ficar neste intervalo.
  void buildTextTweens() {
    final buildTextTween = TextTweenBuilderImpl();

    firstTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.0, 0.1),
    );

    secondTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.1, 0.2),
    );

    thirdTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.2, 0.3),
    );

    fourthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.3, 0.4),
    );

    fifthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.4, 0.5),
    );

    sixthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.5, 0.6),
    );
  }

  /// Vemos que o "position" pede a posição animada que já foi criada no
  /// método acima.
  ///
  /// Este método retorna uma Lista de Widget com a animação de transição
  /// (SlideTransition). Um por cada texto.
  List<Widget> firstTextGroup() {
    return [
      buildTextSlideTransition(
        position: firstTextAnimation,
        text: FirstPageStrings.firstText,
      ),
      buildTextSlideTransition(
        position: secondTextAnimation,
        text: FirstPageStrings.secondText,
      ),
      buildTextSlideTransition(
        position: thirdTextAnimation,
        text: FirstPageStrings.thirdText,
      )
    ];
  }

  /// A mesma coisa do método acima, porém para o segundo conjunto de textos.
  List<Widget> secondTextGroup() {
    return [
      buildTextSlideTransition(
        position: fourthTextAnimation,
        text: FirstPageStrings.fourthText,
      ),
      buildTextSlideTransition(
        position: fifthTextAnimation,
        text: FirstPageStrings.fifthText,
      ),
      buildTextSlideTransition(
        position: sixthTextAnimation,
        text: FirstPageStrings.sixthText,
      )
    ];
  }

  void initAnimationController() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );
  }

  @override
  void initState() {
    initAnimationController();
    buildTextTweens();
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: firstTextGroup(), //O primeiro grupo de textos
              ),
              SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: secondTextGroup(), //O segundo grupo de textos
              )
            ],
          ),
        )
      ],
    );
  }
}
