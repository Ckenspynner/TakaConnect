import 'package:flutter/material.dart';
import 'package:takaconnect/screens/cart/cart_screen.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'icon_btn_with_counter.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      // decoration: BoxDecoration(
      //   color: kSecondaryColor.withOpacity(0.1),
      //   borderRadius: BorderRadius.circular(15),
      // ),

      // child: TextField(
      //   onChanged: (value) => print(value),
      //   decoration: InputDecoration(
      //       contentPadding: EdgeInsets.symmetric(
      //           horizontal: getProportionateScreenWidth(20),
      //           vertical: getProportionateScreenWidth(9)),
      //       border: InputBorder.none,
      //       focusedBorder: InputBorder.none,
      //       enabledBorder: InputBorder.none,
      //       hintText: "Search product",
      //       prefixIcon: const Icon(Icons.search)),
      // ),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SearchField(),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Cart Icon.svg",
          //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
          // ),

          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Menu.svg",
          //   //numOfitem: 3,
          //   press: () {},          // ),
          Image.asset(
            "assets/images/appLogo.png",
            //"assets/images/success.png",
            height: SizeConfig.screenHeight * 0.1, //40%
          ),
          const SizedBox(width: 10),
          const Text('Welcome,\nKenneth Otieno',maxLines: 2, textAlign: TextAlign.start)

        ],
      ),
    );
  }
}
