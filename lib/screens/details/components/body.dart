import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../models/Product.dart';
import '../../../utils/size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    //ColorDots(product: product),

                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/taka_connect.png",
                              width: getProportionateScreenWidth(50),
                              height: getProportionateScreenWidth(50),
                            ),
                            const Text('--TakaConnect--'),
                          ],
                        ),
                        // child: DefaultButton(
                        //   text: "Add To Cart",
                        //   press: () {},
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
