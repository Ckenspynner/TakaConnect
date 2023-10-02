import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:takaconnect/screens/details/components/order_section.dart';

import '../../../models/Product.dart';
import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class ProductDescription extends StatefulWidget {
  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool _show_details = false;
  String chatText = 'Chat', orderText = 'Order';

  int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: widget.product.isFavourite
                  ? const Color(0xFFFFE6E6)
                  : const Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: widget.product.isFavourite
                  ? const Color(0xFFFF4848)
                  : const Color(0xFFDBDEE4),
              height: getProportionateScreenWidth(16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            widget.product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _show_details = !_show_details;
                  });
                },
                child: const Row(
                  children: [
                    Text(
                      "See seller details",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _show_details,
                child: const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                          'This section will hold the sellers basic information...'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const OrderDetails(),
      ],
    );
  }
}
