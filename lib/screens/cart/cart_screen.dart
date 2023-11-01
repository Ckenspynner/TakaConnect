import 'package:flutter/material.dart';
import 'package:takaconnect/components/coustom_bottom_nav_bar.dart';
import 'package:takaconnect/screens/cart/components/check_out_card.dart';
import 'package:takaconnect/screens/home/components/icon_btn_with_counter.dart';
import 'package:takaconnect/utils/enums.dart';
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
          id: '${arguments['id']}',
          firstname: arguments['firstname'],
          lastname: arguments['lastname'],
          contact: arguments['contact'],
          accounttype: arguments['accounttype'],
          county: arguments['county'],
          subcounty: arguments['subcounty'],
          gender: arguments['gender']
      ),
      // bottomNavigationBar: const CheckoutCard(),
      bottomNavigationBar: CustomBottomNavBar(
          selectedMenu: MenuState.order,
          id: '${arguments['id']}',
          firstname: arguments['firstname'],
          lastname: arguments['lastname'],
          contact: arguments['contact'],
          accounttype: arguments['accounttype'],
          county: arguments['county'],
          subcounty: arguments['subcounty'],
          gender: arguments['gender']
      ),
    );
  }

}
