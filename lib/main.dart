import 'package:flutter/material.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/screens/splash/splash_screen.dart';
import 'package:shopping_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
