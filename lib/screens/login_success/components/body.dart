import 'package:flutter/material.dart';
import 'package:shopping_app/components/default_button.dart';
import 'package:shopping_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * 0.45,
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          'Login Success',
          style: TextStyle(
            fontSize: getProportionateScreenHeight(30),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: 'Back to home',
            press: () {},
          ),
        ),
        Spacer()
      ],
    );
  }
}
