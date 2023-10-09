import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:takaconnect/screens/home/components/popular_product.dart';
import 'package:takaconnect/screens/home/components/special_offers.dart';

import '../../../utils/size_config.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool sellerProfile = true;
  bool buyerProfile = false;

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
                      case 'Buyer':
                        sellerProfile = false;
                        buyerProfile = true;
                      case 'Recycler':
                        sellerProfile = false;
                        buyerProfile = true;
                      case 'Partners':
                        print(categories[index]["text"]);
                      case 'Help':
                        print(categories[index]["text"]);
                    }
                  });
                },
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
            child: const SpecialOffers(),
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
                child: const PopularProducts())),
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
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
