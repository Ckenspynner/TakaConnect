import 'package:flutter/material.dart';
import 'package:takaconnect/components/seller_card.dart';
import 'package:takaconnect/components/seller_product_card.dart';
import 'package:takaconnect/data_service/products/productsellerservice.dart';

//import 'package:takaconnect/models/Product.dart';
import 'package:takaconnect/screens/filter_by/filter_screen.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'components/body.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({Key? key}) : super(key: key);
  static String routeName = "/sellers";

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  ProductSellersService productSellersService = ProductSellersService();
  late List<Product> productSellers;
  String CountyName = 'Taita Taveta';
  String SellerContact = '0702407935';

  @override
  void initState() {
    // TODO: implement initState
    //productSellers = productSellersService.getProductSellers();
    super.initState();
  }

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
              scrollDirection: Axis.horizontal, //ListOfTanaRiverProductSellers
              child: CountyName == 'Mombasa'
                  ? FutureBuilder<ListOfMombasaProductSellers>(
                      future: productSellersService.getMombasaProductSellers(),
                      builder: (context, snapshot) {
                        List<Product>? productSellers =
                            snapshot.data?.productSellers;

                        if (snapshot.hasError) {
                          return const Text('error');
                        }
                        if (snapshot.hasData) {
                          return Wrap(direction: Axis.vertical, children: [
                            //...?productSellers?.map((product) {return Text(product.seller);}).toList(),
                            ...List.generate(
                              productSellers!.length,
                              (index) {
                                //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                                //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                                //CASE : Rubber Sellers ,Tyre ,Kisauni
                                if (arguments['barTitle'] ==
                                        '${arguments['filterTitle']} Sellers' &&
                                    arguments['filterType'] !=
                                        'All Categories Types' &&
                                    arguments['filterCounty'] !=
                                        'All Sub-County') {
                                  return productSellers![index].location !=
                                          arguments['filterCounty']
                                      ? const SizedBox.shrink()
                                      : SellerCard(
                                          product: productSellers![index]);
                                }

                                //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                                if (arguments['barTitle'] ==
                                    '${arguments['filterTitle']} Sellers') {
                                  return productSellers![index].category !=
                                          arguments['filterTitle']
                                      ? const SizedBox.shrink()
                                      : SellerCard(
                                          product: productSellers![index]);
                                }

                                //CASE : Product List ,All Categories Types ,All Sub-County
                                if (arguments['barTitle'] == 'Product List' &&
                                    arguments['filterType'] ==
                                        'All Categories Types' &&
                                    arguments['filterCounty'] ==
                                        'All Sub-County') {
                                  return SellerCard(
                                      product: productSellers![index]);
                                }

                                //CASE : Product List ,All Categories Types ,Changamwe
                                if (arguments['barTitle'] == 'Product List' &&
                                    arguments['filterType'] ==
                                        'All Categories Types' &&
                                    arguments['filterCounty'] !=
                                        'All Sub-County') {
                                  return productSellers![index].location !=
                                          arguments['filterCounty']
                                      ? const SizedBox.shrink()
                                      : SellerCard(
                                          product: productSellers![index]);
                                }

                                //Paper Sellers ,Cardboard ,All Sub-County
                                if (arguments['barTitle'] != 'Product List' &&
                                    arguments['filterType'] !=
                                        'All Categories Types' &&
                                    arguments['filterCounty'] ==
                                        'All Sub-County') {
                                  return productSellers![index].category !=
                                              arguments['filterTitle'] &&
                                          productSellers![index].categorytype !=
                                              arguments['filterType']
                                      ? const SizedBox.shrink()
                                      : SellerCard(
                                          product: productSellers![index]);
                                }

                                //CASE : Your Products ,null ,null
                                if (arguments['barTitle'] == 'Your Products' &&
                                    arguments['filterType'] !=
                                        'All Categories Types' &&
                                    arguments['filterCounty'] !=
                                        'All Sub-County') {
                                  return SellerContact ==
                                          productSellers![index].contact
                                      ? SellerProductCard(
                                          product: productSellers![index])
                                      : const SizedBox.shrink();
                                }

                                //CASE : Product List ,null ,null
                                if (arguments['barTitle'] == 'Product List' &&
                                    arguments['filterType'] !=
                                        'All Categories Types' &&
                                    arguments['filterCounty'] !=
                                        'All Sub-County') {
                                  return SellerCard(
                                      product: productSellers![index]);
                                }

                                return const SizedBox
                                    .shrink(); // here by default width and height is 0
                              },
                            ),
                            SizedBox(height: getProportionateScreenWidth(20)),
                          ]);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    )
                  : CountyName == 'Tana River'
                      ? FutureBuilder<ListOfTanaRiverProductSellers>(
                          future: productSellersService
                              .getTanaRiverProductSellers(),
                          builder: (context, snapshot) {
                            List<Product>? productSellers =
                                snapshot.data?.productSellers;

                            if (snapshot.hasError) {
                              return const Text('error');
                            }
                            if (snapshot.hasData) {
                              return Wrap(direction: Axis.vertical, children: [
                                //...?productSellers?.map((product) {return Text(product.seller);}).toList(),
                                ...List.generate(
                                  productSellers!.length,
                                  (index) {
                                    //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                                    //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                                    //CASE : Rubber Sellers ,Tyre ,Kisauni
                                    if (arguments['barTitle'] ==
                                            '${arguments['filterTitle']} Sellers' &&
                                        arguments['filterType'] !=
                                            'All Categories Types' &&
                                        arguments['filterCounty'] !=
                                            'All Sub-County') {
                                      return productSellers![index].location !=
                                              arguments['filterCounty']
                                          ? const SizedBox.shrink()
                                          : SellerCard(
                                              product: productSellers![index]);
                                    }

                                    //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                                    if (arguments['barTitle'] ==
                                        '${arguments['filterTitle']} Sellers') {
                                      return productSellers![index].category !=
                                              arguments['filterTitle']
                                          ? const SizedBox.shrink()
                                          : SellerCard(
                                              product: productSellers![index]);
                                    }

                                    //CASE : Product List ,All Categories Types ,All Sub-County
                                    if (arguments['barTitle'] ==
                                            'Product List' &&
                                        arguments['filterType'] ==
                                            'All Categories Types' &&
                                        arguments['filterCounty'] ==
                                            'All Sub-County') {
                                      return SellerCard(
                                          product: productSellers![index]);
                                    }

                                    //CASE : Product List ,All Categories Types ,Changamwe
                                    if (arguments['barTitle'] ==
                                            'Product List' &&
                                        arguments['filterType'] ==
                                            'All Categories Types' &&
                                        arguments['filterCounty'] !=
                                            'All Sub-County') {
                                      return productSellers![index].location !=
                                              arguments['filterCounty']
                                          ? const SizedBox.shrink()
                                          : SellerCard(
                                              product: productSellers![index]);
                                    }

                                    //Paper Sellers ,Cardboard ,All Sub-County
                                    if (arguments['barTitle'] !=
                                            'Product List' &&
                                        arguments['filterType'] !=
                                            'All Categories Types' &&
                                        arguments['filterCounty'] ==
                                            'All Sub-County') {
                                      return productSellers![index].category !=
                                                  arguments['filterTitle'] &&
                                              productSellers![index]
                                                      .categorytype !=
                                                  arguments['filterType']
                                          ? const SizedBox.shrink()
                                          : SellerCard(
                                              product: productSellers![index]);
                                    }

                                    //CASE : Your Products ,null ,null
                                    if (arguments['barTitle'] ==
                                            'Your Products' &&
                                        arguments['filterType'] !=
                                            'All Categories Types' &&
                                        arguments['filterCounty'] !=
                                            'All Sub-County') {
                                      return SellerContact ==
                                              productSellers![index].contact
                                          ? SellerProductCard(
                                              product: productSellers![index])
                                          : const SizedBox.shrink();
                                    }

                                    //CASE : Product List ,null ,null
                                    if (arguments['barTitle'] ==
                                            'Product List' &&
                                        arguments['filterType'] !=
                                            'All Categories Types' &&
                                        arguments['filterCounty'] !=
                                            'All Sub-County') {
                                      return SellerCard(
                                          product: productSellers![index]);
                                    }

                                    return const SizedBox
                                        .shrink(); // here by default width and height is 0
                                  },
                                ),
                                SizedBox(
                                    height: getProportionateScreenWidth(20)),
                              ]);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )
                      : CountyName == 'Kwale'
                          ? FutureBuilder<ListOfKwaleProductSellers>(
                              future: productSellersService
                                  .getKwaleProductSellers(),
                              builder: (context, snapshot) {
                                List<Product>? productSellers =
                                    snapshot.data?.productSellers;

                                if (snapshot.hasError) {
                                  return const Text('error');
                                }
                                if (snapshot.hasData) {
                                  return Wrap(
                                      direction: Axis.vertical,
                                      children: [
                                        //...?productSellers?.map((product) {return Text(product.seller);}).toList(),
                                        ...List.generate(
                                          productSellers!.length,
                                          (index) {
                                            //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                                            //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                                            //CASE : Rubber Sellers ,Tyre ,Kisauni
                                            if (arguments['barTitle'] ==
                                                    '${arguments['filterTitle']} Sellers' &&
                                                arguments['filterType'] !=
                                                    'All Categories Types' &&
                                                arguments['filterCounty'] !=
                                                    'All Sub-County') {
                                              return productSellers![index]
                                                          .location !=
                                                      arguments['filterCounty']
                                                  ? const SizedBox.shrink()
                                                  : SellerCard(
                                                      product: productSellers![
                                                          index]);
                                            }

                                            //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                                            if (arguments['barTitle'] ==
                                                '${arguments['filterTitle']} Sellers') {
                                              return productSellers![index]
                                                          .category !=
                                                      arguments['filterTitle']
                                                  ? const SizedBox.shrink()
                                                  : SellerCard(
                                                      product: productSellers![
                                                          index]);
                                            }

                                            //CASE : Product List ,All Categories Types ,All Sub-County
                                            if (arguments['barTitle'] ==
                                                    'Product List' &&
                                                arguments['filterType'] ==
                                                    'All Categories Types' &&
                                                arguments['filterCounty'] ==
                                                    'All Sub-County') {
                                              return SellerCard(
                                                  product:
                                                      productSellers![index]);
                                            }

                                            //CASE : Product List ,All Categories Types ,Changamwe
                                            if (arguments['barTitle'] ==
                                                    'Product List' &&
                                                arguments['filterType'] ==
                                                    'All Categories Types' &&
                                                arguments['filterCounty'] !=
                                                    'All Sub-County') {
                                              return productSellers![index]
                                                          .location !=
                                                      arguments['filterCounty']
                                                  ? const SizedBox.shrink()
                                                  : SellerCard(
                                                      product: productSellers![
                                                          index]);
                                            }

                                            //Paper Sellers ,Cardboard ,All Sub-County
                                            if (arguments['barTitle'] !=
                                                    'Product List' &&
                                                arguments['filterType'] !=
                                                    'All Categories Types' &&
                                                arguments['filterCounty'] ==
                                                    'All Sub-County') {
                                              return productSellers![index]
                                                              .category !=
                                                          arguments[
                                                              'filterTitle'] &&
                                                      productSellers![index]
                                                              .categorytype !=
                                                          arguments[
                                                              'filterType']
                                                  ? const SizedBox.shrink()
                                                  : SellerCard(
                                                      product: productSellers![
                                                          index]);
                                            }

                                            //CASE : Your Products ,null ,null
                                            if (arguments['barTitle'] ==
                                                    'Your Products' &&
                                                arguments['filterType'] !=
                                                    'All Categories Types' &&
                                                arguments['filterCounty'] !=
                                                    'All Sub-County') {
                                              return SellerContact ==
                                                      productSellers![index]
                                                          .contact
                                                  ? SellerProductCard(
                                                      product: productSellers![
                                                          index])
                                                  : const SizedBox.shrink();
                                            }

                                            //CASE : Product List ,null ,null
                                            if (arguments['barTitle'] ==
                                                    'Product List' &&
                                                arguments['filterType'] !=
                                                    'All Categories Types' &&
                                                arguments['filterCounty'] !=
                                                    'All Sub-County') {
                                              return SellerCard(
                                                  product:
                                                      productSellers![index]);
                                            }

                                            return const SizedBox
                                                .shrink(); // here by default width and height is 0
                                          },
                                        ),
                                        SizedBox(
                                            height: getProportionateScreenWidth(
                                                20)),
                                      ]);
                                } else {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            )
                          : CountyName == 'Kilifi'
                              ? FutureBuilder<ListOfKilifiProductSellers>(
                                  future: productSellersService
                                      .getKilifiProductSellers(),
                                  builder: (context, snapshot) {
                                    List<Product>? productSellers =
                                        snapshot.data?.productSellers;

                                    if (snapshot.hasError) {
                                      return const Text('error');
                                    }
                                    if (snapshot.hasData) {
                                      return Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            //...?productSellers?.map((product) {return Text(product.seller);}).toList(),
                                            ...List.generate(
                                              productSellers!.length,
                                              (index) {
                                                //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                                                //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                                                //CASE : Rubber Sellers ,Tyre ,Kisauni
                                                if (arguments['barTitle'] ==
                                                        '${arguments['filterTitle']} Sellers' &&
                                                    arguments['filterType'] !=
                                                        'All Categories Types' &&
                                                    arguments['filterCounty'] !=
                                                        'All Sub-County') {
                                                  return productSellers![index]
                                                              .location !=
                                                          arguments[
                                                              'filterCounty']
                                                      ? const SizedBox.shrink()
                                                      : SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                }

                                                //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                                                if (arguments['barTitle'] ==
                                                    '${arguments['filterTitle']} Sellers') {
                                                  return productSellers![index]
                                                              .category !=
                                                          arguments[
                                                              'filterTitle']
                                                      ? const SizedBox.shrink()
                                                      : SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                }

                                                //CASE : Product List ,All Categories Types ,All Sub-County
                                                if (arguments['barTitle'] ==
                                                        'Product List' &&
                                                    arguments['filterType'] ==
                                                        'All Categories Types' &&
                                                    arguments['filterCounty'] ==
                                                        'All Sub-County') {
                                                  return SellerCard(
                                                      product: productSellers![
                                                          index]);
                                                }

                                                //CASE : Product List ,All Categories Types ,Changamwe
                                                if (arguments['barTitle'] ==
                                                        'Product List' &&
                                                    arguments['filterType'] ==
                                                        'All Categories Types' &&
                                                    arguments['filterCounty'] !=
                                                        'All Sub-County') {
                                                  return productSellers![index]
                                                              .location !=
                                                          arguments[
                                                              'filterCounty']
                                                      ? const SizedBox.shrink()
                                                      : SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                }

                                                //Paper Sellers ,Cardboard ,All Sub-County
                                                if (arguments['barTitle'] !=
                                                        'Product List' &&
                                                    arguments['filterType'] !=
                                                        'All Categories Types' &&
                                                    arguments['filterCounty'] ==
                                                        'All Sub-County') {
                                                  return productSellers![index]
                                                                  .category !=
                                                              arguments[
                                                                  'filterTitle'] &&
                                                          productSellers![index]
                                                                  .categorytype !=
                                                              arguments[
                                                                  'filterType']
                                                      ? const SizedBox.shrink()
                                                      : SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                }

                                                //CASE : Your Products ,null ,null
                                                if (arguments['barTitle'] ==
                                                        'Your Products' &&
                                                    arguments['filterType'] !=
                                                        'All Categories Types' &&
                                                    arguments['filterCounty'] !=
                                                        'All Sub-County') {
                                                  return SellerContact ==
                                                          productSellers![index]
                                                              .contact
                                                      ? SellerProductCard(
                                                          product:
                                                              productSellers![
                                                                  index])
                                                      : const SizedBox.shrink();
                                                }

                                                //CASE : Product List ,null ,null
                                                if (arguments['barTitle'] ==
                                                        'Product List' &&
                                                    arguments['filterType'] !=
                                                        'All Categories Types' &&
                                                    arguments['filterCounty'] !=
                                                        'All Sub-County') {
                                                  return SellerCard(
                                                      product: productSellers![
                                                          index]);
                                                }

                                                return const SizedBox
                                                    .shrink(); // here by default width and height is 0
                                              },
                                            ),
                                            SizedBox(
                                                height:
                                                    getProportionateScreenWidth(
                                                        20)),
                                          ]);
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                )
                              : CountyName == 'Lamu'
                                  ? FutureBuilder<ListOfLamuProductSellers>(
                                      future: productSellersService
                                          .getLamuProductSellers(),
                                      builder: (context, snapshot) {
                                        List<Product>? productSellers =
                                            snapshot.data?.productSellers;

                                        if (snapshot.hasError) {
                                          return const Text('error');
                                        }
                                        if (snapshot.hasData) {
                                          return Wrap(
                                              direction: Axis.vertical,
                                              children: [
                                                //...?productSellers?.map((product) {return Text(product.seller);}).toList(),
                                                ...List.generate(
                                                  productSellers!.length,
                                                  (index) {
                                                    //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                                                    //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                                                    //CASE : Rubber Sellers ,Tyre ,Kisauni
                                                    if (arguments[
                                                                'barTitle'] ==
                                                            '${arguments['filterTitle']} Sellers' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return productSellers![
                                                                      index]
                                                                  .location !=
                                                              arguments[
                                                                  'filterCounty']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                                                    if (arguments['barTitle'] ==
                                                        '${arguments['filterTitle']} Sellers') {
                                                      return productSellers![
                                                                      index]
                                                                  .category !=
                                                              arguments[
                                                                  'filterTitle']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //CASE : Product List ,All Categories Types ,All Sub-County
                                                    if (arguments['barTitle'] ==
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] ==
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] ==
                                                            'All Sub-County') {
                                                      return SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                    }

                                                    //CASE : Product List ,All Categories Types ,Changamwe
                                                    if (arguments['barTitle'] ==
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] ==
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return productSellers![
                                                                      index]
                                                                  .location !=
                                                              arguments[
                                                                  'filterCounty']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //Paper Sellers ,Cardboard ,All Sub-County
                                                    if (arguments['barTitle'] !=
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] ==
                                                            'All Sub-County') {
                                                      return productSellers![
                                                                          index]
                                                                      .category !=
                                                                  arguments[
                                                                      'filterTitle'] &&
                                                              productSellers![
                                                                          index]
                                                                      .categorytype !=
                                                                  arguments[
                                                                      'filterType']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //CASE : Your Products ,null ,null
                                                    if (arguments['barTitle'] ==
                                                            'Your Products' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return SellerContact ==
                                                              productSellers![
                                                                      index]
                                                                  .contact
                                                          ? SellerProductCard(
                                                              product:
                                                                  productSellers![
                                                                      index])
                                                          : const SizedBox
                                                              .shrink();
                                                    }

                                                    //CASE : Product List ,null ,null
                                                    if (arguments['barTitle'] ==
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                    }

                                                    return const SizedBox
                                                        .shrink(); // here by default width and height is 0
                                                  },
                                                ),
                                                SizedBox(
                                                    height:
                                                        getProportionateScreenWidth(
                                                            20)),
                                              ]);
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    )
                                  : FutureBuilder<
                                      ListOfTaitaTavetaProductSellers>(
                                      future: productSellersService
                                          .getTaitaTavetaProductSellers(),
                                      builder: (context, snapshot) {
                                        List<Product>? productSellers =
                                            snapshot.data?.productSellers;

                                        if (snapshot.hasError) {
                                          return const Text('error');
                                        }
                                        if (snapshot.hasData) {
                                          return Wrap(
                                              direction: Axis.vertical,
                                              children: [
                                                //...?productSellers?.map((product) {return Text(product.seller);}).toList(),
                                                ...List.generate(
                                                  productSellers!.length,
                                                  (index) {
                                                    //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
                                                    //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');

                                                    //CASE : Rubber Sellers ,Tyre ,Kisauni
                                                    if (arguments[
                                                                'barTitle'] ==
                                                            '${arguments['filterTitle']} Sellers' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return productSellers![
                                                                      index]
                                                                  .location !=
                                                              arguments[
                                                                  'filterCounty']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //CASE : Paper Sellers ,All Categories Types ,All Sub-County
                                                    if (arguments['barTitle'] ==
                                                        '${arguments['filterTitle']} Sellers') {
                                                      return productSellers![
                                                                      index]
                                                                  .category !=
                                                              arguments[
                                                                  'filterTitle']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //CASE : Product List ,All Categories Types ,All Sub-County
                                                    if (arguments['barTitle'] ==
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] ==
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] ==
                                                            'All Sub-County') {
                                                      return SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                    }

                                                    //CASE : Product List ,All Categories Types ,Changamwe
                                                    if (arguments['barTitle'] ==
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] ==
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return productSellers![
                                                                      index]
                                                                  .location !=
                                                              arguments[
                                                                  'filterCounty']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //Paper Sellers ,Cardboard ,All Sub-County
                                                    if (arguments['barTitle'] !=
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] ==
                                                            'All Sub-County') {
                                                      return productSellers![
                                                                          index]
                                                                      .category !=
                                                                  arguments[
                                                                      'filterTitle'] &&
                                                              productSellers![
                                                                          index]
                                                                      .categorytype !=
                                                                  arguments[
                                                                      'filterType']
                                                          ? const SizedBox
                                                              .shrink()
                                                          : SellerCard(
                                                              product:
                                                                  productSellers![
                                                                      index]);
                                                    }

                                                    //CASE : Your Products ,null ,null
                                                    if (arguments['barTitle'] ==
                                                            'Your Products' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return SellerContact ==
                                                              productSellers![
                                                                      index]
                                                                  .contact
                                                          ? SellerProductCard(
                                                              product:
                                                                  productSellers![
                                                                      index])
                                                          : const SizedBox
                                                              .shrink();
                                                    }

                                                    //CASE : Product List ,null ,null
                                                    if (arguments['barTitle'] ==
                                                            'Product List' &&
                                                        arguments[
                                                                'filterType'] !=
                                                            'All Categories Types' &&
                                                        arguments[
                                                                'filterCounty'] !=
                                                            'All Sub-County') {
                                                      return SellerCard(
                                                          product:
                                                              productSellers![
                                                                  index]);
                                                    }

                                                    return const SizedBox
                                                        .shrink(); // here by default width and height is 0
                                                  },
                                                ),
                                                SizedBox(
                                                    height:
                                                        getProportionateScreenWidth(
                                                            20)),
                                              ]);
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
            )
          ],
        ),
      ),
    );
  }
}

// child: Column(
// children: [
// ...List.generate(
// productSellers!.length,
// (index) {
// //print(productSellers![index].title);
// return Text(productSellers![index].title);
// return const SizedBox
//     .shrink(); // here by default width and height is 0
// },
// ),
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // ...List.generate(
// //   productSellers!.length,
// //   (index) {
// //     //print('${arguments['barTitle']} ,${arguments['filterType']} ,${arguments['filterCounty']}');
// //     //print('${arguments['barTitle']},${arguments['filterType']},${arguments['filterCounty']},${arguments['filterCounty']},${demoCategories[_iterateSellers].subcounty},$_iterateSellers');
// //
// //     //CASE : Paper Sellers ,All Categories Types ,All Sub-County
// //     if (arguments['barTitle'] == '${arguments['filterTitle']} Sellers') {
// //       return productSellers![index].title !=
// //               arguments['filterTitle']
// //           ? const SizedBox.shrink()
// //           : SellerCard(product: productSellers![index]);
// //     }
// //
// //     //CASE : Product List ,All Categories Types ,All Sub-County
// //     if (arguments['barTitle'] == 'Product List' &&
// //         arguments['filterType'] == 'All Categories Types' &&
// //         arguments['filterCounty'] == 'All Sub-County') {
// //       return SellerCard(product: productSellers![index]);
// //     }
// //
// //     //CASE : Product List ,All Categories Types ,Changamwe
// //     if (arguments['barTitle'] == 'Product List' &&
// //         arguments['filterType'] == 'All Categories Types' &&
// //         arguments['filterCounty'] != 'All Sub-County') {
// //       return productSellers![index].subcounty !=
// //               arguments['filterCounty']
// //           ? const SizedBox.shrink()
// //           : SellerCard(product: productSellers![index]);
// //     }
// //
// //     //Paper Sellers ,Cardboard ,All Sub-County
// //     if (arguments['barTitle'] != 'Product List' &&
// //         arguments['filterType'] != 'All Categories Types' &&
// //         arguments['filterCounty'] == 'All Sub-County') {
// //       return productSellers![index].title !=
// //                   arguments['filterTitle'] &&
// //               productSellers![index].materialType !=
// //                   arguments['filterType']
// //           ? const SizedBox.shrink()
// //           : SellerCard(product: productSellers![index]);
// //     }
// //
// //     //CASE : Your Products ,null ,null
// //     if (arguments['barTitle'] == 'Your Products' &&
// //         arguments['filterType'] != 'All Categories Types' &&
// //         arguments['filterCounty'] != 'All Sub-County') {
// //       return SellerProductCard(product: productSellers![index]);
// //     }
// //
// //     //CASE : Rubber Sellers ,Tyre ,Kisauni
// //     if (arguments['barTitle'] != 'Product List' &&
// //         arguments['filterType'] != 'All Categories Types' &&
// //         arguments['filterCounty'] != 'All Sub-County') {
// //       return productSellers![index].title !=
// //                   arguments['filterTitle'] &&
// //               productSellers![index].materialType !=
// //                   arguments['filterType'] &&
// //               productSellers![index].subcounty !=
// //                   arguments['filterCounty']
// //           ? const SizedBox.shrink()
// //           : SellerCard(product: productSellers![index]);
// //     }
// //
// //     //CASE : Product List ,null ,null
// //     if (arguments['barTitle'] == 'Product List' &&
// //         arguments['filterType'] != 'All Categories Types' &&
// //         arguments['filterCounty'] != 'All Sub-County') {
// //       return SellerCard(product: productSellers![index]);
// //     }
// //
// //     return const SizedBox
// //         .shrink(); // here by default width and height is 0
// //   },
// // ),
// SizedBox(height: getProportionateScreenWidth(20)),
// ],
// ),
