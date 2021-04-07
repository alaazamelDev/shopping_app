import 'package:flutter/material.dart';
import 'package:shopping_app/screens/sign_in/components/no_account_text.dart';

import '../../../size_config.dart';
import 'forgot_pass_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(14),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Please enter your email and we will send \nyou a link to return to your account',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
              NoAccountText()
            ],
          ),
        ),
      ),
    );
  }
}
