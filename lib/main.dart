import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takaconnect/firebase_options.dart';
import 'package:takaconnect/firebase_repository/authentication_repository/authentication_repository.dart';
import 'package:takaconnect/screens/complete_profile/complete_profile_screen.dart';
import 'package:takaconnect/screens/home/home_screen.dart';
import 'package:takaconnect/screens/login_success/login_success_screen.dart';
import 'package:takaconnect/screens/sign_in/sign_in_screen.dart';
import 'package:takaconnect/screens/splash/SplashAnimation.dart';
import 'package:takaconnect/screens/splash/SplashDashboard.dart';
import 'package:takaconnect/utils/http_strings.dart';

import 'package:takaconnect/utils/routes.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'package:takaconnect/utils/theme.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((value) => Get.put(AuthenticationRepository()));
//   SharedPreferences prefs =await SharedPreferences.getInstance();
//   var authenticatePhoneNumber=prefs.getString('isLogin1');
//   runApp(authenticatePhoneNumber == null ?MyApp():LoggedIn());
// }

///---------------------------------------------------------------------------------------------------
// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var authenticatePhoneNumber = prefs.getString('isLogin1');
//   runApp(authenticatePhoneNumber == null ? MyApp() : LoggedIn());
// }


// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // You have to call it on your starting screen
//     SizeConfig().init(context);
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TakaConnect',
//       theme: AppTheme.lightTheme(context),
//       initialRoute: LoginSuccessScreen.routeName,//HomeScreen.routeName,//SplashAnimation.routeName,
//       routes: routes,
//     );
//   }
// }
//
// class LoggedIn extends StatelessWidget {
//   LoggedIn({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // You have to call it on your starting screen
//     SizeConfig().init(context);
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TakaConnect',
//       theme: AppTheme.lightTheme(context),
//       initialRoute: SplashDashboard.routeName,
//       routes: routes,
//     );
//   }
// }
///------------------------------------------------------------------------------------------------------------


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var authenticatePhoneNumber = prefs.getString('isLogin1');
  runApp(authenticatePhoneNumber == null ? const MyApp() : const LoggedIn());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //You have to call it on your starting screen
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TakaConnect',
      theme: AppTheme.lightTheme(context),
      initialRoute: SignInScreen.routeName,//SplashAnimation.routeName,//LoginSuccessScreen.routeName,HomeScreen.routeName,//
      routes: routes,


      // debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home: const Home(),

    );
  }
}

class LoggedIn extends StatelessWidget {
  const LoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //You have to call it on your starting screen
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TakaConnect',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashDashboard.routeName,
      routes: routes,
    );
  }
}
