import 'package:flutter/material.dart';
import 'package:takaconnect/screens/home/components/section_title.dart';
import 'package:takaconnect/screens/home/components/waste_player_map.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            //DiscountBanner(),
            const Categories(),
            //SpecialOffers(),
            //SizedBox(height: getProportionateScreenWidth(30)),
            //const PopularProducts(),
            const WastePlayerMap(),
          ],
        ),
      ),
    );
  }
}
