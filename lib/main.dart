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



import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';


import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter_inappwebview/flutter_inappwebview.dart';



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
  var PhoneNumber = prefs.getString('loggedAccNumber');
  var CountyName = prefs.getString('loggedAccCounty');
  runApp(PhoneNumber == null ? const MyApp() : LoggedIn(PhoneNumber:PhoneNumber,CountyName:CountyName));
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
      initialRoute: SplashAnimation.routeName,//SignInScreen.routeName,//LoginSuccessScreen.routeName,HomeScreen.routeName,//
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
  final String? PhoneNumber;
  final String? CountyName;
  const LoggedIn({Key? key, required this.PhoneNumber, required this.CountyName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //You have to call it on your starting screen
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TakaConnect',
      theme: AppTheme.lightTheme(context),
      home: SplashDashboard(PhoneNumber:PhoneNumber,CountyName:CountyName),
      // initialRoute: SplashDashboard.routeName,arguments: {
      // 'contact': otpPhoneNumber,
      // 'county': selectedValue2,
      // 'term': true,
      // 'appBarTitle':'Login Successful',
      // 'welcomeTitle':'Login Success',
      // },
      routes: routes,
    );
  }
}


// main(){
//   runApp(const MyApp());
//
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'TakaConnect',
//
//       home: InteractiveMap(),
//
//       // debugShowCheckedModeBanner: false,
//       // title: 'Flutter Demo',
//       // theme: ThemeData(
//       //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       //   useMaterial3: true,
//       // ),
//       // home: const Home(),
//
//     );
//   }
// }
//
//
// class InteractiveMap extends StatefulWidget {
//   const InteractiveMap({Key? key}) : super(key: key);
//
//   @override
//   State<InteractiveMap> createState() => _InteractiveMapState();
// }
//
// class _InteractiveMapState extends State<InteractiveMap> {
//
//   double _progress = 0;
//   late InAppWebViewController  inAppWebViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: ()async{
//
//         var isLastPage = await inAppWebViewController.canGoBack();
//
//         if(isLastPage){
//           inAppWebViewController.goBack();
//           return false;
//         }
//
//         return true;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           body: Stack(
//             children: [
//               InAppWebView(
//                 initialUrlRequest: URLRequest(
//                     url: Uri.parse("https://ckenspynner.github.io/Waste-Resource-Player/")
//                 ),
//                 onWebViewCreated: (InAppWebViewController controller){
//                   inAppWebViewController = controller;
//                 },
//                 onProgressChanged: (InAppWebViewController controller , int progress){
//                   setState(() {
//                     _progress = progress / 100;
//                   });
//                 },
//               ),
//               _progress < 1 ? Container(
//                 child: LinearProgressIndicator(
//                   value: _progress,
//                 ),
//               ):SizedBox()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }