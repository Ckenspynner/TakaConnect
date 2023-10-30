import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takaconnect/screens/contactus/contactus.dart';
import 'package:takaconnect/screens/home/components/popular_product.dart';
import 'package:takaconnect/screens/home/components/special_offers.dart';
import 'package:takaconnect/screens/partners/partners.dart';

import '../../../utils/size_config.dart';

class Categories extends StatefulWidget {
  final String firstname;
  final String accounttype;
  final String lastname;
  final String county;
  final String subcounty;
  final String contact;

  const Categories({
    Key? key,
    required this.accounttype,
    required this.firstname,
    required this.lastname,
    required this.county,
    required this.subcounty,
    required this.contact,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool sellerProfile = false;
  bool buyerProfile = false;
  String Account = '';

  @override
  void initState() {
    // TODO: implement initState
    widget.accounttype == 'Seller'
        ? sellerProfile = true
        : sellerProfile = false;
    widget.accounttype == 'Buyer' || widget.accounttype == 'Recycler'
        ? buyerProfile = true
        : buyerProfile = false;
    Account = widget.accounttype;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      // {"icon": "assets/icons/Flash Icon.svg", "text": "Seller"},
      // {"icon": "assets/icons/Bill Icon.svg", "text": "Buyer"},
      // {"icon": "assets/icons/Game Icon.svg", "text": "Recycler"},
      // {"icon": "assets/icons/Gift Icon.svg", "text": "Partners"},
      // {"icon": "assets/icons/Discover.svg", "text": "Help"},

      {"icon": "assets/icons/seller.svg", "text": "Seller"},
      {"icon": "assets/icons/buyer.svg", "text": "Buyer"},
      {"icon": "assets/icons/recycle.svg", "text": "Recycler"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Partners"},
      {"icon": "assets/icons/help.svg", "text": "Help"},
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  icon: categories[index]["icon"],
                  text: categories[index]["text"],
                  press: () {
                    // print(categories[index]["text"]);
                    setState(() {
                      switch (categories[index]["text"]) {
                        case 'Seller':
                          sellerProfile = true;
                          buyerProfile = false;
                          Account = 'Seller';
                        case 'Buyer':
                          sellerProfile = false;
                          buyerProfile = true;
                          Account = 'Buyer';
                        case 'Recycler':
                          sellerProfile = false;
                          buyerProfile = true;
                          Account = 'Recycler';
                        case 'Partners':
                          Navigator.pushNamed(context, PartnerScreen.routeName);
                        case 'Help':
                          Navigator.pushNamed(context, ContactScreen.routeName);
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: sellerProfile,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            opacity: sellerProfile ? 1 : 0,
            child: SpecialOffers(
              firstname: widget.firstname,
              lastname: widget.lastname,
              contact: widget.contact,
              county: widget.county,
              subcounty: widget.subcounty,
              accounttype: widget.accounttype,
            ),
          ),
        ),
        Visibility(
            visible: buyerProfile,
            maintainAnimation: true,
            maintainState: true,
            child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                opacity: buyerProfile ? 1 : 0,
                child: PopularProducts(
                  customerAccount: Account,
                  firstname: widget.firstname,
                  lastname: widget.lastname,
                  contact: widget.contact,
                  county: widget.county,
                  subcounty: widget.subcounty,
                  accounttype: widget.accounttype,
                ))),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(110),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(30)),
              height: getProportionateScreenWidth(100),
              width: getProportionateScreenWidth(100),
              decoration: BoxDecoration(
                //color: Color(0xFFFFECDF),
                color: const Color(0xFFC4DFB4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.5 * ffem / fem,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryCard1 extends StatelessWidget {
  const CategoryCard1({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                //color: Color(0xFFFFECDF),
                color: const Color(0xFFC4DFB4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 12 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.5 * ffem / fem,
              ),
            )
          ],
        ),
      ),
    );
  }
}
