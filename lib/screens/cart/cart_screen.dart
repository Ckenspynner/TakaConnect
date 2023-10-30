import 'package:flutter/material.dart';
import 'package:takaconnect/screens/home/components/icon_btn_with_counter.dart';
import 'package:takaconnect/utils/size_config.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      body: Body(
        contact: arguments['contact'],
        county: arguments['county'],
        subcounty: arguments['subcounty'],
        //accounttype: arguments['accounttype'],
      ),
      //bottomNavigationBar: const CheckoutCard(),
    );
  }

}
