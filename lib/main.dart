import 'package:flutter/material.dart';
import 'package:takaconnect/screens/splash/splash_screen.dart';
import 'package:takaconnect/utils/routes.dart';
import 'package:takaconnect/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TakaConnect',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
