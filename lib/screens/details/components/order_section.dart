import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/size_config.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  bool _show_order_panel = false;
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
        Visibility(
          visible: _show_order_panel,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            opacity: _show_order_panel ? 1 : 0,
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
                  ],
                ),
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
