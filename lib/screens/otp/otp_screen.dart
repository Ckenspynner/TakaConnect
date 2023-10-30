import 'package:flutter/material.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/screens/home/home_screen.dart';

import '../../utils/size_config.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(),

    );
  }
}
