import 'package:flutter/material.dart';
import 'package:shopping_app/components/custom_suffix_icon.dart';
import 'package:shopping_app/components/default_button.dart';
import 'package:shopping_app/components/form_error.dart';
import 'package:shopping_app/screens/forgot_pass/frogot_pass_screen.dart';
import 'package:shopping_app/screens/login_success/login_success_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildEmailField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordField(),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Checkbox(
                    activeColor: kPrimaryColor,
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    }),
                Text('Remember Me'),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(16)),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  //if the email and password are valid go to next screen
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        labelText: 'Email',
        //added this feature here because if we placed it in theme file,
        //It would not work
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        } else if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        } else if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        }
        return null;
      },
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        labelText: 'Password',
        //added this feature here because if we placed it in theme file,
        //It would not work
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffix(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
