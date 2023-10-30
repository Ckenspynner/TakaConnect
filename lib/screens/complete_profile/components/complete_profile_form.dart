import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takaconnect/firebase_repository/controller/signup_controller.dart';
import 'package:takaconnect/screens/otp_home/otp.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../utils/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  // String authenticatePhoneNumber = '';

  // Future<void> loggedAcountNumber() async {
  //
  //     SharedPreferences pref =await SharedPreferences.getInstance();
  //     pref.setString('phoneNumber', authenticatePhoneNumber!);
  //
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.firstname,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your first name";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            controller: controller.lastname,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your last name";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(

            controller: controller.phoneNo,
            keyboardType: TextInputType.phone,
            maxLength:13,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter your phone number";
              } else if (value.length != 13) {

                if(value.length < 13){return "Phone number too short";}
                if(value.length != 13){return "Use this format +257xxxxxxxx";}
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Phone Name",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                // setState(() {
                //   authenticatePhoneNumber = controller.phoneNo.text.trim();
                //   loggedAcountNumber();
                // });

                Navigator.pushNamed(context, OTP.routeName,arguments: {
                  'otpPhoneNumber': controller.phoneNo.text,
                },);
                  //Register and Authenticate Users
                  //SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
              }
              // if (_formKey.currentState!.validate()) {
              //
              //   //Step-3 Get Users and Pass it to Controller
              //
              //   //Store User Data
              //   // final licensedCollector = LicensedCollectorModel(
              //   //     username: controller.controllerUsername.text.toTitleCase().trim(),
              //   //     email: 'LA${controller.controllerEmail.text.trim()}'.toLowerCase(),
              //   //     county: controller.controllerCounty.text.toTitleCase().trim(),
              //   //     subCountry: controller.controllerSubCountry.text.toTitleCase().trim(),
              //   //     ward: controller.controllerWard.text.toTitleCase().trim(),
              //   //     license: 'LA${controller.controllerLicense.text.trim()}'.toUpperCase(),
              //   //     phoneNumber: controller.controllerPhoneNumber.text.trim()
              //   // );
              //
              //   //Register and Authenticate Users
              //   SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
              // }
            },
          ),
        ],
      ),
    );
  }
}
