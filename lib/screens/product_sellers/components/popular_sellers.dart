import 'package:flutter/material.dart';
import 'package:takaconnect/components/seller_card.dart';
import 'package:takaconnect/models/Product.dart';
import 'package:takaconnect/screens/home/components/section_title.dart';
import 'package:takaconnect/utils/size_config.dart';

class PopularSeller extends StatelessWidget {

  const PopularSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding:
        //   EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        //   child: SectionTitle(title: "Categories", press: () {}),
        // ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          //child: Row(
          // child: Column(
          //   children: [
          //     Text('Okobo'),
          //   ],
          // ),
          child: Column(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) {
                      print('${demoProducts[index].title},${demoProducts[index].materialType},${demoProducts[index].subcounty}');
                  //if (demoProducts[index].isPopular) {
                    return SellerCard(product: demoProducts[index]);
                  //}

                  //return const SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              //SizedBox(width: getProportionateScreenWidth(20)),
              SizedBox(height: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
