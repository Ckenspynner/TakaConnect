import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:takaconnect/screens/splash/SplashAnimation.dart';
import 'package:takaconnect/screens/splash/splash_screen.dart';
import 'package:takaconnect/utils/http_strings.dart';

import 'package:http/http.dart' as http;

import 'package:takaconnect/utils/routes.dart';
import 'package:takaconnect/utils/theme.dart';


extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}


void main() {
  runApp(const MyApp());
}
// test() async {
//   var response = await http.get(Uri.parse(mombasaproductsellersUrl));
//   print(jsonDecode(response.body)[1]);
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //test();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TakaConnect',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashAnimation.routeName,
      routes: routes,
    );
  }
}






// String token = '428086bf6b4d116807f29f130788e3401c2b8377';
// void main(){createProduct();}
// createProduct() async {
// var uri = Uri.parse(createmombasaproductsellerUrl);///--------------------create mombasa produce seller
// Map data = {
//   'seller': 'Kevin Ouma',
//   'contact': '0712345677',
//   'quantity': '20',
//   'category': 'Plastic',
//   'categorytype': 'PET',
//   'itemcolor': 'White',
//   'location': 'Nyali',
//   'description': 'Ut consequat ante a quam ullamcorper, quis tristique mauris placerat. Donec aliquam tincidunt vehicula. Etiam ac fringilla leo.',
//   'county': 'Mombasa'
// };
//
// var response = await http.post(uri, body: data, headers: {
//   'Authorization': ' Token $token',
// });
// print(response);
// }
//
// updateProduct() {
//
// }
//
// deleteProduct() {
//
// }

















// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() => runApp(MaterialApp(
//   home: Home(),
//   debugShowCheckedModeBanner: false,
// ));
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   XFile? image;
//
//   final ImagePicker picker = ImagePicker();
//
//   //we can upload image from camera or from gallery based on parameter
//   Future getImage(ImageSource media) async {
//     var img = await picker.pickImage(source: media);
//
//     setState(() {
//       image = img;
//     });
//   }
//
//   //show popup dialog
//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: Text('Please choose media to select'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     //if user click this button, user can upload image from gallery
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.gallery);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.image),
//                         Text('From Gallery'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     //if user click this button. user can upload image from camera
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.camera);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.camera),
//                         Text('From Camera'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             const SizedBox(
//               height: 10,
//             ),
//             //if image not null show the image
//             //if image null show text
//             image != null
//                 ? Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.file(
//                   //to show image, you type like this.
//                   File(image!.path),
//                   fit: BoxFit.cover,
//                   width: MediaQuery.of(context).size.width,
//                   height: 300,
//                 ),
//               ),
//             )
//                 : const Text(
//               "No Image",
//               style: TextStyle(fontSize: 20),
//             ),
//
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   myAlert();
//                 },
//                 child: const Text('Upload/Take Photo'),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }




















//
// // main()async {
// //   var response = await http.get(Uri.parse(user_http_path));
// //   print(response.body);
// // }
//
//

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
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
//   ListOfMombasaProductSellers listOfMombasaProductSellers = await ProductSellersService().getProductSellers();
//   print(listOfMombasaProductSellers.productSellers[0].seller);
// }
//
//
// previusmain() async {
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
//     "Authorization": "Token 428086bf6b4d116807f29f130788e3401c2b8377"
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
//   var logoutResponse = await http.get(Uri.parse(logoutUrl), headers: {
//     "Authorization": "Token 428086bf6b4d116807f29f130788e3401c2b8377"
//   });
//   print(logoutResponse.body);
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
//   ///------------------------------------------------------------------------------------------Login------------------------------
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
