import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  final String id;
  final String firstname;
  final String lastname;
  final String contact;
  final String accounttype;
  final String county;
  final String subcounty;
  final String gender;

  const Body(
      {super.key,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.contact,
      required this.accounttype,
      required this.county,
      required this.subcounty,
      required this.gender
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(gender:gender),
          SizedBox(height: 20),
          ProfileMenu(
            text: '$firstname $lastname',
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: '$county - $subcounty',
            icon: "assets/icons/Location point.svg",
            press: () {},
          ),
          ProfileMenu(
            text: contact,
            icon: "assets/icons/Phone OTP.svg",
            press: () {},
          ),

          ProfileMenu(
            text: accounttype,
            icon: accounttype == 'Seller'?"assets/icons/seller.svg":accounttype == 'Buyer'?"assets/icons/buyer.svg":"assets/icons/recycle.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
