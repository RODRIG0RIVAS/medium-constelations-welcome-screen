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
  late Animation<Offset> firstText;
  late Animation<Offset> secondText;
  late Animation<Offset> thirdText;
  late Animation<Offset> fourthText;
  late Animation<Offset> fifthText;
  late Animation<Offset> sixthText;

  final image = AssetImage('assets/images/welcome_first.jpg');

  final buildTextSlideTransition = TextSlideTransitionImpl();

  void buildTextTweens() {
    final buildTextTween = TextTweenBuilderImpl();

    firstText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.0, 0.1),
    );

    secondText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.1, 0.2),
    );

    thirdText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.2, 0.3),
    );

    fourthText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.3, 0.4),
    );

    fifthText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.4, 0.5),
    );

    sixthText = buildTextTween(
      animationController: animationController,
      firstPositionOffsetValue: -1.2,
      interval: Interval(0.5, 0.6),
    );
  }

  List<Widget> firstTextGroup() {
    return [
      buildTextSlideTransition(
        position: firstText,
        text: FirstPageStrings.firstText,
      ),
      buildTextSlideTransition(
        position: secondText,
        text: FirstPageStrings.secondText,
      ),
      buildTextSlideTransition(
        position: thirdText,
        text: FirstPageStrings.thirdText,
      )
    ];
  }

  List<Widget> secondTextGroup() {
    return [
      buildTextSlideTransition(
        position: fourthText,
        text: FirstPageStrings.fourthText,
      ),
      buildTextSlideTransition(
        position: fifthText,
        text: FirstPageStrings.fifthText,
      ),
      buildTextSlideTransition(
        position: sixthText,
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
                children: firstTextGroup(),
              ),
              SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: secondTextGroup(),
              )
            ],
          ),
        )
      ],
    );
  }
}
