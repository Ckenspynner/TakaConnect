import 'package:flutter/material.dart';
import 'package:takaconnect/screens/splash/SplashAnimation.dart';
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
      initialRoute: SplashAnimation.routeName,
      routes: routes,
    );
  }
}


// // main()async {
// //   var response = await http.get(Uri.parse(user_http_path));
// //   print(response.body);
// // }
//
//

// import 'dart:convert';
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:takaconnect/utils/http_strings.dart';
//
// django_get() async {
//   var response = await http.get(Uri.parse(user_http_path));
//   print(jsonDecode(response.body)["Username"]);
// }
//
// django_post() async {
//   var response = await http.post(Uri.parse(user_http_path), body: {
//     "username": "Admin2",
//     "email": "admin2@gmail.com",
//     "password": "Admin2",
//   });
//   print(jsonDecode(response.body));
// }
//
// main() async {
//   AuthService authService = AuthService();
//
//   ///------------------------------------------------------------------------------------------Registration-----------------------
//   ///Registration
//   //RegistrationResponse? registrationResponse = await authService.registration('admin', 'admin@gmail.com', 'admin', 'admin');
//   //print(registrationResponse);
//
//   ///Registration Errors Validation
//   // if (registrationResponse != null) {
//   //   ///Email
//   //   if (registrationResponse != null) {
//   //     registrationResponse.email?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///Username
//   //   if (registrationResponse != null) {
//   //     registrationResponse.username?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///non_field_error
//   //   if (registrationResponse != null) {
//   //     registrationResponse.non_field_error?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///Password1
//   //   if (registrationResponse != null) {
//   //     registrationResponse.password1?.forEach((element) {
//   //       print(element);
//   //     }); //map((e) => print(e));
//   //   }
//   //
//   //   ///Key
//   //   if (registrationResponse == null) {
//   //     print(registrationResponse.key);
//   //   }
//   // }
//
//   ///------------------------------------------------------------------------------------------Login------------------------------
//   ///Login
//   // LoginResponse? loginResponse =
//   //     await authService.login('admin@gmail.com', 'admin');
//   //print(LoginResponse);
//
//   ///Login Errors Validation
//   // if (loginResponse != null) {
//   //   //non_field_error
//   //   if (loginResponse != null) {
//   //     loginResponse.non_field_error?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   //Key
//   //   if (loginResponse != null) {
//   //     print(loginResponse.key);
//   //   }
//   // }
//
//   ///------------------------------------------------------------------------------------------Get User-----------------------
//   ///Get User
//   var displayResponse = await http.get(Uri.parse(display_user_Url), headers: {
//     "Authorization":"Token 428086bf6b4d116807f29f130788e3401c2b8377"
//   });
//   print(displayResponse.body);
//
//   ///Get User Errors Validation
//   // if (registrationResponse != null) {
//   //   ///Email
//   //   if (registrationResponse != null) {
//   //     registrationResponse.email?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///Username
//   //   if (registrationResponse != null) {
//   //     registrationResponse.username?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///non_field_error
//   //   if (registrationResponse != null) {
//   //     registrationResponse.non_field_error?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///Password1
//   //   if (registrationResponse != null) {
//   //     registrationResponse.password1?.forEach((element) {
//   //       print(element);
//   //     }); //map((e) => print(e));
//   //   }
//   //
//   //   ///Key
//   //   if (registrationResponse == null) {
//   //     print(registrationResponse.key);
//   //   }
//   // }
//
//   ///------------------------------------------------------------------------------------------Logout-----------------------
//   ///Logout
//   // var logoutResponse = await http.get(Uri.parse(logoutUrl), headers: {
//   //   "Authorization":"Token 428086bf6b4d116807f29f130788e3401c2b8377"
//   // });
//   // print(logoutResponse.body);
//
//   ///Logout Errors Validation
//   // if (registrationResponse != null) {
//   //   ///Email
//   //   if (registrationResponse != null) {
//   //     registrationResponse.email?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///Username
//   //   if (registrationResponse != null) {
//   //     registrationResponse.username?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///non_field_error
//   //   if (registrationResponse != null) {
//   //     registrationResponse.non_field_error?.forEach((element) {
//   //       print(element);
//   //     });
//   //   }
//   //
//   //   ///Password1
//   //   if (registrationResponse != null) {
//   //     registrationResponse.password1?.forEach((element) {
//   //       print(element);
//   //     }); //map((e) => print(e));
//   //   }
//   //
//   //   ///Key
//   //   if (registrationResponse == null) {
//   //     print(registrationResponse.key);
//   //   }
//   // }
// }
//
// class AuthService {
//   ///------------------------------------------------------------------------------------------Registration-----------------------
//   //Registration
//   Future<RegistrationResponse?> registration(
//       String username, String email, String password1, String password2) async {
//     var response = await http.post(Uri.parse(registrationUrl), body: {
//       "username": username,
//       "email": email,
//       "password1": password1,
//       "password2": password2,
//     });
//     //print(response.body);
//     return RegistrationResponse.fromJson(jsonDecode(response.body));
//     //return response.body;
//   }
//
// ///------------------------------------------------------------------------------------------Login------------------------------
//   //Login
//   Future<LoginResponse?> login(String usernameOremail, String password) async {
//     var response = await http.post(Uri.parse(loginUrl), body: {
//       "username": usernameOremail,
//       "password": password,
//     });
//     //print(response.body);
//     return LoginResponse.fromJson(jsonDecode(response.body));
//     //return response.body;
//   }
// }
//
// ///------------------------------------------------------------------------------------------Registration-----------------------
// class RegistrationResponse {
//   List<dynamic>? non_field_error;
//   List<dynamic>? password1;
//   List<dynamic>? username;
//   List<dynamic>? email;
//   dynamic? key;
//
//   RegistrationResponse({
//     this.email,
//     this.username,
//     this.non_field_error,
//     this.key,
//     this.password1,
//   });
//
//   factory RegistrationResponse.fromJson(mapOfBody) {
//     // print(mapOfBody["key"]);
//     // print(mapOfBody["password1"]);
//     return RegistrationResponse(
//       email: mapOfBody["email"],
//       key: mapOfBody["key"],
//       username: mapOfBody["username"],
//       password1: mapOfBody["password1"],
//       non_field_error: mapOfBody["non_field_error"],
//     );
//   }
// }
//
// ///------------------------------------------------------------------------------------------Login------------------------------
// class LoginResponse {
//   List<dynamic>? non_field_error;
//   dynamic? key;
//
//   LoginResponse({
//     this.non_field_error,
//     this.key,
//   });
//
//   factory LoginResponse.fromJson(mapOfBody) {
//     //print(mapOfBody["key"]);
//     // print(mapOfBody["password1"]);
//     return LoginResponse(
//       key: mapOfBody["key"],
//       non_field_error: mapOfBody["non_field_error"],
//     );
//   }
// }

//{"password1":["This password is too short. It must contain at least 8 characters.","This password is entirely numeric."]}
//{"username":["A user with that username already exists."]}
//{"non_field_errors":["The two password fields didn't match."]}
