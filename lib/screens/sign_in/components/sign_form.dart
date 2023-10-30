import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:takaconnect/screens/otp/otp_screen.dart';
import 'package:takaconnect/utils/http_strings.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../helper/keyboard.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';
import 'package:http/http.dart' as http;


class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password, otpPhoneNumber;
  bool? remember = false;
  bool otpRequest = false;
  String selectedValue2 = "Select Your County";
  final List<String?> errors = [];

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Your County", child: Text("Select Your County")),
      const DropdownMenuItem(
          value: "Taita Taveta", child: Text("Taita Taveta")),
      const DropdownMenuItem(value: "Tana River", child: Text("Tana River")),
      const DropdownMenuItem(value: "Mombasa", child: Text("Mombasa")),
      const DropdownMenuItem(value: "Kwale", child: Text("Kwale")),
      const DropdownMenuItem(value: "Kilifi", child: Text("Kilifi")),
      const DropdownMenuItem(value: "Lamu", child: Text("Lamu")),
    ];
    return menuItems;
  }

  ///---------------------------------------------------------------OTP CODE----------------------

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smscode = "";

  _signInWithMobileNumber() async {
    UserCredential _credential;
    User user;
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: otpPhoneNumber,
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            await _auth.signInWithCredential(authCredential).then((value) {
              Navigator.pushNamed(context, LoginSuccessScreen.routeName,
                  arguments: {
                    //'otpPhoneNumber': phoneNo.text,
                    'contact': otpPhoneNumber,
                    'county': selectedValue2,
                    'term': true,
                    'appBarTitle':'Login Successful',
                  });
            });
          },
          verificationFailed: ((error) {
            print(error);
          }),
          codeSent: (String verificationId, [int? forceResendingToken]) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                      title: Text("Enter OTP Code"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OTPTextField(
                            length: 6,
                            width: MediaQuery.of(context).size.width,
                            fieldWidth: getProportionateScreenWidth(35),
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.box,
                            onChanged: (val) {},
                            onCompleted: (code) {
                              setState(() {
                                smscode = code;
                              });
                            },
                          ),
                        ],
                      ),
                      actions: [
                        DefaultButton(
                          text: "Send",
                          press: () {
                            FirebaseAuth auth = FirebaseAuth.instance;
                            PhoneAuthCredential _credential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: smscode);
                            auth
                                .signInWithCredential(_credential)
                                .then((result) {
                              if (result != null) {
                                Navigator.pop(context);

                                Navigator.pushNamed(
                                    context, LoginSuccessScreen.routeName,
                                    arguments: {
                                      //'otpPhoneNumber': phoneNo.text,
                                      'contact': otpPhoneNumber,
                                      'county': selectedValue2,
                                      'term': true,
                                      'appBarTitle':'Login Successful',
                                    });
                              }
                            }).catchError((e) {
                              print(e);
                            });
                          },
                        ),
                      ],
                    ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          timeout: Duration(seconds: 60));
    } catch (e) {}
  }

  ///---------------------------------------------------------------END OTP CODE------------------

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  verifycontact(contact,county) async {

    var path;//,county ='Lamu',contact ='+254702407935';

    if (county == 'Mombasa') {
      //works
      path = mombasaUserListUrl;
    }
    if (county == 'Lamu') {
      //works
      path = lamuUserListUrl;
    }
    if (county == 'Kwale') {
      //works
      path = kwaleUserListUrl;
    }
    if (county == 'Kilifi') {
      //works
      path = kilifiUserListUrl;
    }
    if (county == 'Tana River') {
      //works
      path = tanariverUserListUrl;
    }
    if (county == 'Taita Taveta') {
      //works
      path = taitatavetaUserListUrl;
    }

    var response = await http.get(Uri.parse(path));
    //print(jsonDecode(response.body));
    var verify = jsonDecode(response.body);
    verify.forEach((element) {
      if(element["contact"].contains(contact)){
        //there is element
        //_signInWithMobileNumber();
        //userprint();
        // setState(() {
        //   otpRequest = true;
        // });
        Navigator.pushNamed(context, LoginSuccessScreen.routeName,
            arguments: {
              'contact': otpPhoneNumber,
              'county': selectedValue2,
              'term': true,
              'appBarTitle':'Login Successful',
            });

      }else{
        final snackBar = SnackBar(
          content: const Text(
            'No record found\n\n1. Please provide valid credentials\n2. The number your provided does not have an account.',textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
          behavior: SnackBarBehavior.floating,
          dismissDirection: DismissDirection.up,
          backgroundColor: Colors.redAccent, elevation: 1000,
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 155,
              left: 10,
              right: 10),

        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.transparent,
            ),
            validator: (value) =>
                value == "Select Your County" ? "Select Your County" : null,
            //dropdownColor: Colors.blueAccent,
            value: selectedValue2,
            icon: const Icon(Icons.keyboard_arrow_down),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue2 = newValue!;
              });
            },
            items: dropdownItems2,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: remember,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {
          //         setState(() {
          //           remember = value;
          //         });
          //       },
          //     ),
          //     const Text("Remember me"),
          //     const Spacer(),
          //     GestureDetector(
          //       onTap: () => Navigator.pushNamed(
          //           context, ForgotPasswordScreen.routeName),
          //       child: const Text(
          //         "Forgot Password",
          //         style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     )
          //   ],
          // ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          otpRequest == false
              ? DefaultButton(
                  text: "Continue",
                  press: () {
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   // if all are valid then go to success screen
                    //   KeyboardUtil.hideKeyboard(context);
                    //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                    // }
                    if (_formKey.currentState!.validate()) {
                      KeyboardUtil.hideKeyboard(context);
                      verifycontact(otpPhoneNumber,selectedValue2);
                    }
                  },
                )
              : Column(
                  children: [
                    const Text('Sending OTP...'),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: const Center(
                          child: LinearProgressIndicator(
                        backgroundColor: Color(0xFFB4B4B4),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      )),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => email = newValue,
      maxLength: 13,
      onChanged: (value) {
        otpPhoneNumber = value;
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (value.length > 13 || value.length < 13) {
          removeError(error: kInvalidPhoneError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "format +2547xxxxxxxx";
        } else if (value!.length > 13 || value!.length < 13) {
          removeError(error: kInvalidPhoneError);
          return kInvalidPhoneError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone OTP.svg"),
      ),
    );
  }

// TextFormField buildPasswordFormField() {
//   return TextFormField(
//     obscureText: true,
//     onSaved: (newValue) => password = newValue,
//     onChanged: (value) {
//       if (value.isNotEmpty) {
//         removeError(error: kPassNullError);
//       } else if (value.length >= 8) {
//         removeError(error: kShortPassError);
//       }
//       return null;
//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         addError(error: kPassNullError);
//         return "";
//       } else if (value.length < 8) {
//         addError(error: kShortPassError);
//         return "";
//       }
//       return null;
//     },
//     decoration: const InputDecoration(
//       labelText: "Password",
//       hintText: "Enter your password",
//       // If  you are using latest version of flutter then lable text and hint text shown like this
//       // if you r using flutter less then 1.20.* then maybe this is not working properly
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
//     ),
//   );
// }

// TextFormField buildPhoneNumberFormField() {
//   return TextFormField(
//     keyboardType: TextInputType.emailAddress,
//     onSaved: (newValue) => email = newValue,
//     onChanged: (value) {
//       if (value.isNotEmpty) {
//         removeError(error: kPhoneNumberNullError);
//       } else if (emailValidatorRegExp.hasMatch(value)) {
//         removeError(error: kInvalidEmailError);
//       }
//       return null;
//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         addError(error: kPhoneNumberNullError);
//         return "";
//       } else if (!emailValidatorRegExp.hasMatch(value)) {
//         addError(error: kInvalidEmailError);
//         return "";
//       }
//       return null;
//     },
//     decoration: InputDecoration(
//       labelText: "Email",
//       hintText: "Enter your email",
//       // If  you are using latest version of flutter then lable text and hint text shown like this
//       // if you r using flutter less then 1.20.* then maybe this is not working properly
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
//     ),
//   );
// }
}
