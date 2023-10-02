import 'package:flutter/material.dart';
import 'package:takaconnect/screens/product_sellers/components/SellerHeader.dart';
import 'package:takaconnect/screens/product_sellers/components/popular_sellers.dart';
import 'package:takaconnect/utils/size_config.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: getProportionateScreenHeight(20)),
            //const SellerHeader(),
            PopularSeller(),
          ],
        ),
      ),
    );
  }
}
