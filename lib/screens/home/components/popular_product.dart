import 'package:flutter/material.dart';
import 'package:takaconnect/data_service/products/productsellerservice.dart';
import 'package:takaconnect/screens/product_sellers/sellers.dart';
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../utils/size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Categories", press: () {Navigator.pushNamed(context, SellerScreen.routeName,arguments: {'barTitle': 'Product List'},);}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoCategories.length,
                (index) {

                  if (demoCategories[index].isPopular) {
                    return ProductCard(product: demoCategories[index]);
                  }

                  return const SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
