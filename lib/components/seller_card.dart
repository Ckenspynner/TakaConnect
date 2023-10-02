import 'package:flutter/material.dart';

import '../models/Product.dart';
import '../screens/details/details_screen.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(
                      color: Colors.greenAccent,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(width),
                      child: AspectRatio(
                        aspectRatio: 1.02,
                        child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                          decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Hero(
                            tag: product.id.toString(),
                            child: Image.asset(product.images[0]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category: ${product.title}',
                          style: const TextStyle(color: Colors.black),
                          maxLines: 2,
                        ),
                        Text(
                          'Type: ${product.materialType}\n',
                          style: const TextStyle(color: Colors.black),
                          maxLines: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add_location_rounded,
                                  color: Colors.black
                              ),
                              onPressed: () {},
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.location,
                                  //style: const TextStyle(color: Colors.black),
                                  maxLines: 2,
                                ),
                                Text(
                                  product.subcounty,
                                  //style: const TextStyle(color: Colors.black),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
