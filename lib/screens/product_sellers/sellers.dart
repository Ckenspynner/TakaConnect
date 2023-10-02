import 'package:flutter/material.dart';
import 'package:takaconnect/components/seller_card.dart';
import 'package:takaconnect/models/Product.dart';
import 'package:takaconnect/screens/filter_by/filter_screen.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'components/body.dart';

class SellerScreen extends StatelessWidget {
  static String routeName = "/sellers";

  const SellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    //print(arguments['barTitle']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 25),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, FilterScreen.routeName);
            },
            child: Container(
              padding: const EdgeInsets.only(right: 25),
              child: const Icon(
                Icons.sort,
                color: Colors.black,
              ),
            ),
          ),
        ],
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Text(
            arguments['barTitle'],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  ...List.generate(
                    demoProducts.length,
                    (index) {
                      print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');

                      // print(
                      //     '${demoProducts[index].title},${demoProducts[index].materialType},${demoProducts[index].subcounty}');
                      return SellerCard(product: demoProducts[index]);
                    },
                  ),
                  SizedBox(height: getProportionateScreenWidth(20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
