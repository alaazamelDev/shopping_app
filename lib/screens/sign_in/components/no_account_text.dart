import 'package:flutter/material.dart';
import 'package:shopping_app/screens/forgot_pass/frogot_pass_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: getProportionateScreenHeight(16)),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            ' Sign up',
            style: TextStyle(
              fontSize: getProportionateScreenHeight(16),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
