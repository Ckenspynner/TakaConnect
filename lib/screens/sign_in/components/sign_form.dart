import 'package:flutter/material.dart';
import 'package:takaconnect/screens/otp/otp_screen.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../helper/keyboard.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password, otpPhoneNumber;
  bool? remember = false;
  final List<String?> errors = [];

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildPasswordFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
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
                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                Navigator.pushNamed(context, OtpScreen.routeName,arguments: {'otpPhoneNumber': otpPhoneNumber},);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
            otpPhoneNumber = value;
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        } else if (value.length > 10 || value.length < 10) {
          removeError(error: kInvalidPhoneError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        } else if (value!.length > 10 || value!.length < 10) {
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
