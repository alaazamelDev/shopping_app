import 'package:flutter/material.dart';
import 'package:shopping_app/components/default_button.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/screens/sign_in/sign_in_screen.dart';

import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people to connect with store \naround United States of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easiest way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"],
                ),
                itemCount: splashData.length,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => buildWidget(index: index),
                  ),
                ),
                Spacer(flex: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DefaultButton(
                    text: "Continue",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                ),
                Spacer()
              ]),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildWidget({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 6),
      width: currentIndex == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
    );
  }
}
