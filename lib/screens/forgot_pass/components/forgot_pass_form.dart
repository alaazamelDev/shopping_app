import 'package:flutter/material.dart';
import 'package:shopping_app/components/custom_suffix_icon.dart';
import 'package:shopping_app/components/default_button.dart';
import 'package:shopping_app/components/form_error.dart';
import 'package:shopping_app/size_config.dart';

import '../../../constants.dart';

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState.validate()) {
                //Do creating email operations
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
        ],
      ),
    );
  }
}
