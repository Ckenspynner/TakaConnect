// import 'dart:convert';
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:takaconnect/utils/http_strings.dart';
//
//
// django_get() async {
//   var response = await http.get(Uri.parse(user_http_path));
//   print(jsonDecode(response.body)["Username"]);
// }
//
// django_post() async {
//   var response = await http.post(Uri.parse(user_http_path),
//       body: {
//         "username":"Admin2",
//         "email":"admin2@gmail.com",
//         "password":"Admin2",
//       }
//   );
//   print(jsonDecode(response.body));
// }
//
// main() async{
//   AuthService authService = AuthService();
//   //var registrationResponse = await authService.registration('Branolspin14', 'branolspin14@gmail.com', '@4851Cken', '@4851Cken');
//   RegistrationResponse? registrationResponse = await authService.registration('Branolspin14', 'branolspin14@gmail.com', '@4851Cken', '@4851Cken');
//   //print(registrationResponse);
//
//   //Validation errors
//   if (registrationResponse != null){
//     //Email
//     if (registrationResponse != null){
//       registrationResponse.email!.forEach((element) {print(element);});
//     }
//
//     //Username
//     if (registrationResponse != null){
//       registrationResponse.username!.forEach((element) {print(element);});
//     }
//
//     //non_field_error
//     if (registrationResponse != null){
//       registrationResponse.non_field_error!.forEach((element) {print(element);});
//     }
//
//     //Password1
//     if (registrationResponse != null){
//       registrationResponse.password1!.forEach((element) {print(element);});//map((e) => print(e));
//     }
//
//     //Key
//     if (registrationResponse.key! == []){
//       print(registrationResponse.key!);
//     }
//   }
// }
//
// class AuthService {
//   //Future<String> registration(String username, String email, String password1, String password2) async {
//   Future<RegistrationResponse?> registration(String username, String email, String password1, String password2) async {
//     var response = await http.post(Uri.parse(registrationUrl),
//         body: {
//           "username":username,
//           "email":email,
//           "password1":password1,
//           "password2":password2,
//         }
//     );
//     print(response.body);
//     return RegistrationResponse.fromJson(jsonDecode(response.body));
//     //return response.body;
//   }
//
// }
//
// class RegistrationResponse {
//   List <dynamic>? non_field_error;
//   List <dynamic>? password1;
//   List <dynamic>? username;
//   List <dynamic>? email;
//   dynamic? key;
//
//   RegistrationResponse({this.email,this.username,this.non_field_error,this.key,this.password1,});
//
//   factory RegistrationResponse.fromJson(mapOfBody){
//     // print(mapOfBody["key"]);
//     // print(mapOfBody["password1"]);
//     return RegistrationResponse(
//       email: mapOfBody["email"]??[],
//       key: mapOfBody["key"]??[],
//       username: mapOfBody["username"]??[],
//       password1: mapOfBody["password1"]??[],
//       non_field_error: mapOfBody["non_field_error"]??[],
//     );
//   }
// }
//
// //{"password1":["This password is too short. It must contain at least 8 characters.","This password is entirely numeric."]}
// //{"username":["A user with that username already exists."]}
// //{"non_field_errors":["The two password fields didn't match."]}