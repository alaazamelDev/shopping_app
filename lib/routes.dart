import 'package:flutter/widgets.dart';
import 'package:shopping_app/screens/forgot_pass/frogot_pass_screen.dart';
import 'package:shopping_app/screens/login_success/login_success_screen.dart';
import 'package:shopping_app/screens/sign_in/sign_in_screen.dart';
import 'package:shopping_app/screens/splash/splash_screen.dart';

//here all the route name can be found here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen()
};
