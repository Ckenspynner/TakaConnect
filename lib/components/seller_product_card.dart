import 'package:flutter/material.dart';
import 'package:takaconnect/data_service/products/productsellerservice.dart';
import 'package:takaconnect/screens/product_sellers/sellers.dart';

import 'package:http/http.dart' as http;
import 'package:takaconnect/utils/http_strings.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class SellerProductCard extends StatelessWidget {
  SellerProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  String sellercounty = 'Taita Taveta';

  deleteSellerProduct(token, id) async {
    //,sellercounty
    var path;

    sellercounty = 'Taita Taveta';

    if (sellercounty == 'Mombasa') {//works
      path = deleteupdatemombasaproductsellerUrl;
    }
    if (sellercounty == 'Lamu') {//works
      path = deleteupdatelamuproductsellerUrl;
    }
    if (sellercounty == 'Kwale') {//works
      path = deleteupdatekwaleproductsellerUrl;
    }
    if (sellercounty == 'Kilifi') {//works
      path = deleteupdatekilifiproductsellerUrl;
    }
    if (sellercounty == 'Tana River') {//works
      path = deleteupdatetanariverproductsellerUrl;
    }
    if (sellercounty == 'Taita Taveta') {//works
      path = deleteupdatetaitatavetaproductsellerUrl;
    }

    var uri = Uri.parse("$path/$id/");

    ///--------------------create mombasa produce seller

    var response = await http.delete(uri, headers: {
      'Authorization': ' Token $token',
    });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 147,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.greenAccent,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: ListView(
                    // This next line does the trick.
                    padding:
                        EdgeInsets.only(right: getProportionateScreenWidth(20)),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(width),
                            child: AspectRatio(
                              aspectRatio: 1.02,
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(20)),
                                decoration: BoxDecoration(
                                  color: kSecondaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Hero(
                                  tag: product.id.toString(),
                                  child: Image.network(product.image),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(20)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: getProportionateScreenWidth(10)),
                              Text(
                                'Category: ${product.category}',
                                style: const TextStyle(color: Colors.black),
                                maxLines: 2,
                              ),
                              Text(
                                'Type: ${product.categorytype}\n',
                                style: const TextStyle(color: Colors.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              Text(
                                "${product.county} - ${product.location}",
                                //style: const TextStyle(color: Colors.black),
                                maxLines: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // IconButton(
                                  //   icon: const Icon(Icons.edit,
                                  //       color: kPrimaryColor
                                  //   ),
                                  //   onPressed: () {},
                                  // ),
                                  TextButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Warning',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.redAccent),
                                        ),
                                        content: const Text(
                                          'Are you sure you want to delete this product',
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'Cancel');
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                              ),
                                              Expanded(
                                                child: TextButton(
                                                  onPressed: () {
                                                    //print(product.id);
                                                    deleteSellerProduct(
                                                        '428086bf6b4d116807f29f130788e3401c2b8377',
                                                        product.id);
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                    Navigator.pushNamed(
                                                      context,
                                                      SellerScreen.routeName,
                                                      arguments: {
                                                        'barTitle':
                                                            'Your Products'
                                                      },
                                                    );
                                                  },
                                                  //Navigator.pop(context, 'Yes'),
                                                  child: const Text('Yes'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    //   onPressed: (){
                                    //   print(product.id);
                                    // },
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Delete Product',
                                          style: TextStyle(
                                              color: Colors.redAccent),
                                        ),
                                        SizedBox(
                                          width: getProportionateScreenWidth(5),
                                        ),
                                        Icon(
                                          Icons.delete_forever,
                                          color: Colors.redAccent,
                                          size: getProportionateScreenWidth(20),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // IconButton(
                                  //   icon: const Icon(Icons.delete_forever,
                                  //       color: Colors.redAccent
                                  //   ),
                                  //   onPressed: () {},
                                  // ),

                                  // Column(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text(
                                  //       product.location,
                                  //       //style: const TextStyle(color: Colors.black),
                                  //       maxLines: 2,
                                  //     ),
                                  //     Text(
                                  //       product.county,
                                  //       //style: const TextStyle(color: Colors.black),
                                  //       maxLines: 2,
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  //child:
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
