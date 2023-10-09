import 'package:flutter/material.dart';
import 'package:takaconnect/components/seller_card.dart';
import 'package:takaconnect/components/seller_product_card.dart';
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
            child: arguments['barTitle'] != 'Your Products'
                ? Container(
                    padding: const EdgeInsets.only(right: 25),
                    child: const Icon(
                      Icons.sort,
                      color: Colors.black,
                    ),
                  )
                : Container(),
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
                      //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                      //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                      //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                      if (arguments['barTitle'] == '${arguments['filterTitle']} Sellers') {
                        return demoProducts[index].title !=
                                arguments['filterTitle']
                            ? const SizedBox.shrink()
                            : SellerCard(product: demoProducts[index]);
                      }

                      //CASE : Product List ,All Categories Types ,All Sub-County
                      if (arguments['barTitle'] == 'Product List' &&
                          arguments['filterType'] == 'All Categories Types' &&
                          arguments['filterCounty'] == 'All Sub-County') {
                        return SellerCard(product: demoProducts[index]);
                      }

                      //CASE : Product List ,All Categories Types ,Changamwe
                      if (arguments['barTitle'] == 'Product List' &&
                          arguments['filterType'] == 'All Categories Types' &&
                          arguments['filterCounty'] != 'All Sub-County') {
                        return demoProducts[index].subcounty !=
                                arguments['filterCounty']
                            ? const SizedBox.shrink()
                            : SellerCard(product: demoProducts[index]);
                      }

                      //Paper Sellers ,Cardboard ,All Sub-County
                      if (arguments['barTitle'] != 'Product List' &&
                          arguments['filterType'] != 'All Categories Types' &&
                          arguments['filterCounty'] == 'All Sub-County') {
                        return demoProducts[index].title !=
                                    arguments['filterTitle'] &&
                                demoProducts[index].materialType !=
                                    arguments['filterType']
                            ? const SizedBox.shrink()
                            : SellerCard(product: demoProducts[index]);
                      }

                      //CASE : Your Products ,null ,null
                      if (arguments['barTitle'] == 'Your Products' &&
                          arguments['filterType'] != 'All Categories Types' &&
                          arguments['filterCounty'] != 'All Sub-County') {
                        return SellerProductCard(product: demoProducts[index]);
                      }

                      //CASE : Rubber Sellers ,Tyre ,Kisauni
                      if (arguments['barTitle'] != 'Product List' &&
                          arguments['filterType'] != 'All Categories Types' &&
                          arguments['filterCounty'] != 'All Sub-County') {
                        return demoProducts[index].title !=
                                    arguments['filterTitle'] &&
                                demoProducts[index].materialType !=
                                    arguments['filterType'] &&
                                demoProducts[index].subcounty !=
                                    arguments['filterCounty']
                            ? const SizedBox.shrink()
                            : SellerCard(product: demoProducts[index]);
                      }

                      //CASE : Product List ,null ,null
                      if (arguments['barTitle'] == 'Product List' &&
                          arguments['filterType'] != 'All Categories Types' &&
                          arguments['filterCounty'] != 'All Sub-County') {
                        return SellerCard(product: demoProducts[index]);
                      }

                      return const SizedBox
                          .shrink(); // here by default width and height is 0
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
