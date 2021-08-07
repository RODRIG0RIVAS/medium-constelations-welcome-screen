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
  late Animation<Offset> firstText;
  late Animation<Offset> secondText;
  late Animation<Offset> thirdText;
  late Animation<Offset> fourthText;
  late Animation<Offset> fifthText;

  final image = AssetImage('assets/images/welcome_second.jpg');

  final buildTextSlideTransition = TextSlideTransitionImpl();

  void buildTextTweens() {
    final buildTextTween = TextTweenBuilderImpl();

    firstText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.0, 0.1),
    );

    secondText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.1, 0.2),
    );

    thirdText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.2, 0.3),
    );

    fourthText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.3, 0.4),
    );

    fifthText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: 1.2,
      interval: Interval(0.4, 0.5),
    );
  }

  List<Widget> firstTextGroup() {
    return [
      buildTextSlideTransition(
        position: firstText,
        text: SecondPageStrings.firstText,
      ),
      buildTextSlideTransition(
        position: secondText,
        text: SecondPageStrings.secondText,
      ),
    ];
  }

  List<Widget> secondTextGroup() {
    return [
      buildTextSlideTransition(
        position: thirdText,
        text: SecondPageStrings.thirdText,
      ),
      buildTextSlideTransition(
        position: fourthText,
        text: SecondPageStrings.fourthText,
      ),
      buildTextSlideTransition(
        position: fifthText,
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
