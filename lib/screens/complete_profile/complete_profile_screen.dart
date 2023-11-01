import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:takaconnect/components/custom_surfix_icon.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/main.dart';
import 'package:takaconnect/screens/login_success/login_success_screen.dart';
import 'package:takaconnect/utils/constants.dart';
import 'package:takaconnect/utils/http_strings.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'package:http/http.dart' as http;

import 'components/body.dart';

class CompleteProfileScreen extends StatefulWidget {
  static String routeName = "/complete_profile";

  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var phoneNo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var arguments;

  bool otpRequest = false;

  ///---------------------------------------------------------------OTP CODE----------------------

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smscode = "";

  _signInWithMobileNumber() async {
    UserCredential _credential;
    User user;
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNo.text.trim(),
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            await _auth.signInWithCredential(authCredential).then((value) {
              Navigator.pushNamed(context, LoginSuccessScreen.routeName,
                  arguments: {
                    //'otpPhoneNumber': phoneNo.text,
                    'firstname': firstname.text,
                    'lastname': lastname.text,
                    'contact': phoneNo.text,
                    'accounttype': arguments['accounttype'],
                    'county': arguments['county'],
                    'subcounty': arguments['subcounty'],
                    'gender': arguments['gender'],
                    'term': false,
                    'appBarTitle':'Terms and Conditions',
                    'welcomeTitle':'Get Started',
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
                        fieldWidth:
                        getProportionateScreenWidth(35),
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                        textFieldAlignment:
                        MainAxisAlignment.spaceAround,
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
                    DefaultButton(text: "Send", press: () {
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

                          Navigator.pushNamed(context, LoginSuccessScreen.routeName,
                              arguments: {
                                //'otpPhoneNumber': phoneNo.text,
                                'firstname': firstname.text,
                                'lastname': lastname.text,
                                'contact': phoneNo.text,
                                'accounttype': arguments['accounttype'],
                                'county': arguments['county'],
                                'subcounty': arguments['subcounty'],
                                'gender': arguments['gender'],
                                'term': false,
                                'appBarTitle':'Terms and Conditions',
                                'welcomeTitle':'Get Started',
                              });


                        }
                      }).catchError((e) {
                        print(e);
                      });
                    },),
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


  @override
  Widget build(BuildContext context) {

    arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Text("Complete Profile", style: headingStyle),
                  const Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.06),
                  //CompleteProfileForm(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: firstname,
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
                            suffixIcon: CustomSurffixIcon(
                                svgIcon: "assets/icons/User.svg"),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextFormField(
                          controller: lastname,
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
                            suffixIcon: CustomSurffixIcon(
                                svgIcon: "assets/icons/User.svg"),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        TextFormField(
                          controller: phoneNo,
                          keyboardType: TextInputType.phone,
                          maxLength: 13,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your phone number";
                            } else if (value.length != 13) {
                              if (value.length < 13) {
                                return "Phone number too short";
                              }
                              if (value.length != 13) {
                                return "Use this format +257xxxxxxxx";
                              }
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Phone Name",
                            hintText: "Enter your phone number",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: CustomSurffixIcon(
                                svgIcon: "assets/icons/Phone.svg"),
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        otpRequest == false ? DefaultButton(
                          text: "continue",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              _signInWithMobileNumber();
                              //userprint();
                              // setState(() {
                              //   otpRequest = true;
                              // });
                              // Navigator.pushNamed(context, LoginSuccessScreen.routeName,
                              //     arguments: {
                              //       //'otpPhoneNumber': phoneNo.text,
                              //       'firstname': firstname.text,
                              //       'lastname': lastname.text,
                              //       'contact': phoneNo.text,
                              //       'accounttype': arguments['accounttype'],
                              //       'county': arguments['county'],
                              //       'subcounty': arguments['subcounty'],
                              //       'gender': arguments['gender'],
                              //       'term': false,
                              //       'appBarTitle':'Terms and Conditions',
                              //       'welcomeTitle':'Get Started',
                              //     });

                              //Register and Authenticate Users
                              //SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                            }
                          },
                        ): Column(
                          children: [
                            const Text('Sending OTP...'),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/3,
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
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
