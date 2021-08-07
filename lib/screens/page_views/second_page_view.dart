import 'package:constelations_welcome_screen/animation/text_slide_transition.dart';
import 'package:constelations_welcome_screen/animation/text_tween_builder.dart';
import 'package:constelations_welcome_screen/strings/second_page_strings.dart';
import 'package:flutter/material.dart';

class SecondPageView extends StatefulWidget {
  const SecondPageView({Key? key}) : super(key: key);

  @override
  _SecondPageViewState createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> firstTextAnimation;
  late Animation<Offset> secondTextAnimation;
  late Animation<Offset> thirdTextAnimation;
  late Animation<Offset> fourthTextAnimation;
  late Animation<Offset> fifthTextAnimation;

  final image = AssetImage('assets/images/welcome_second.jpg');

  final buildTextSlideTransition = TextSlideTransitionImpl();

  void buildTextTweens() {
    final buildTextTween = TextTweenBuilderImpl();

    firstTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.0, 0.1),
    );

    secondTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.1, 0.2),
    );

    thirdTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.2, 0.3),
    );

    fourthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.3, 0.4),
    );

    fifthTextAnimation = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.4, 0.5),
    );
  }

  List<Widget> firstTextGroup() {
    return [
      buildTextSlideTransition(
        position: firstTextAnimation,
        text: SecondPageStrings.firstText,
      ),
      buildTextSlideTransition(
        position: secondTextAnimation,
        text: SecondPageStrings.secondText,
      ),
    ];
  }

  List<Widget> secondTextGroup() {
    return [
      buildTextSlideTransition(
        position: thirdTextAnimation,
        text: SecondPageStrings.thirdText,
      ),
      buildTextSlideTransition(
        position: fourthTextAnimation,
        text: SecondPageStrings.fourthText,
      ),
      buildTextSlideTransition(
        position: fifthTextAnimation,
        text: SecondPageStrings.fifthText,
      ),
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
        Positioned(
          right: 15.0,
          top: 65.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: firstTextGroup(),
              ),
              SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: secondTextGroup(),
              )
            ],
          ),
        )
      ],
    );
  }
}
