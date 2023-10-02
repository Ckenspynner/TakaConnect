import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool _show_details = false, _show_order_panel = false;
  String chatText = 'Chat', orderText = 'Order';
  final _dropdownFormKey = GlobalKey<FormState>();

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
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: widget.product.isFavourite
                  ? Color(0xFFFF4848)
                  : Color(0xFFDBDEE4),
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
        Visibility(
          visible: _show_order_panel,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _dropdownFormKey,
              child: Column(
                children: [
                  TextFormField(
                    //controller: controllerCounts,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Quantity',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.category,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Quantity Counts";
                      } else {
                        //   if (int.parse(controllerCounts.text) <= 0) {
                        //     return "Total Counts can't be 0 or Less than 0";
                        //   } else {
                        //     return null;
                        //   }
                      }
                    },
                  ),
                  // SizedBox(
                  //   height: getProportionateScreenWidth(20),
                  // ),
                  // TextFormField(
                  //   //controller: controllerCounts,
                  //   keyboardType: TextInputType.number,
                  //   decoration: InputDecoration(
                  //     labelText: 'Enter Phone Number',
                  //     suffixIcon: IconButton(
                  //       onPressed: () {},
                  //       icon: const Icon(
                  //         Icons.phone_forwarded,
                  //       ),
                  //     ),
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "Enter Phone Number";
                  //     } else {
                  //       //   if (int.parse(controllerCounts.text) <= 0) {
                  //       //     return "Total Counts can't be 0 or Less than 0";
                  //       //   } else {
                  //       //     return null;
                  //       //   }
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if (chatText == 'Chat') {
                      //print('${random(100000000, 999999999)}');
                      Uri sms = Uri.parse(
                          'sms:07${random(10000000, 99999999)}?body=Hello, Is this available.');
                      if (await launchUrl(sms)) {
                        //app opened
                      } else {
                        //app is not opened
                      }
                    } else {}
                    setState(() {
                      _show_order_panel = false;
                      chatText = 'Chat';
                      orderText = 'Order';
                    });
                  },
                  child: Container(
                    color: _show_order_panel
                        ? Colors.red
                        : const Color(0xFFC4DFB4),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          chatText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ), //color: kPrimaryColor),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          _show_order_panel
                              ? Icons.close_outlined
                              : Icons.message,
                          size: 12,
                          color: Colors.white,
                          //color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (orderText == 'Order') {
                        _show_order_panel = !_show_order_panel;
                        chatText = 'Close';
                        orderText = 'Submit';
                      } else {
                        if (_dropdownFormKey.currentState!.validate()) {
                          _show_order_panel = !_show_order_panel;
                          chatText = 'Chat';
                          orderText = 'Order';
                        }
                      }
                    });
                  },
                  child: Container(
                    color: _show_order_panel
                        ? Colors.green
                        : const Color(0xFFC4DFB4),
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          orderText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ), //color: kPrimaryColor),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          //Icons.shopping_cart_checkout_sharp,
                          _show_order_panel
                              ? Icons.arrow_forward
                              : Icons.shopping_cart_checkout_sharp,
                          size: 12,
                          color: Colors.white,
                          //color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
