import 'package:constelations_welcome_screen/screens/page_views/first_page_view.dart';
import 'package:constelations_welcome_screen/screens/page_views/second_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final pages = [FirstPageView(), SecondPageView()];
  final pageController = PageController();
  double? _currentPage = 0.0;

  final pageTransitionDuration = Duration(milliseconds: 300);
  final pageTransitionCurve = Curves.ease;

  void precacheImages() {
    precacheImage(AssetImage('assets/images/welcome_first.jpg'), context);
    precacheImage(AssetImage('assets/images/welcome_second.jpg'), context);
  }

  void uiOverlaySettings() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.transparent,
    ));
  }

  Widget backButton() {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.white,
      onPressed: () {
        pageController.previousPage(
          duration: pageTransitionDuration,
          curve: pageTransitionCurve,
        );
      },
    );
  }

  Widget forwardButton() {
    return IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      color: Colors.white,
      onPressed: () {
        pageController.nextPage(
          duration: pageTransitionDuration,
          curve: pageTransitionCurve,
        );
      },
    );
  }

  Widget continueButton() {
    return IconButton(
      icon: Icon(Icons.check),
      color: Colors.white,
      onPressed: () {},
    );
  }

  Widget leftButton() {
    if (_currentPage == 0) {
      return Container(
        height: 0,
      );
    } else {
      return backButton();
    }
  }

  Widget rightButton() {
    if ((_currentPage! > 0.1) && (_currentPage! <= 1.0)) {
      return continueButton();
    } else {
      return forwardButton();
    }
  }

  Widget navigatorWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Row(
          children: [
            leftButton(),
            Spacer(),
            rightButton(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      precacheImages();
    });

    uiOverlaySettings();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    //precacheImages();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                pageController.addListener(() {
                  setState(() {
                    _currentPage = pageController.page;
                  });
                });
                return pages[index];
              }),
          navigatorWidget(),
        ],
      ),
    );
  }
}
