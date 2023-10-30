import 'package:flutter/material.dart';
import 'package:takaconnect/components/seller_card.dart';
import 'package:takaconnect/components/seller_product_card.dart';
import 'package:takaconnect/data_service/products/productsellerservice.dart';
import 'package:takaconnect/models/partners.dart';

//import 'package:takaconnect/models/Product.dart';
import 'package:takaconnect/screens/filter_by/filter_screen.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PartnerScreen extends StatefulWidget {
  const PartnerScreen({Key? key}) : super(key: key);
  static String routeName = "/partners";

  @override
  State<PartnerScreen> createState() => _PartnerScreenState();
}

class _PartnerScreenState extends State<PartnerScreen> {
  final partner = PartnerModel.partner;

  @override
  Widget build(BuildContext context) {
    //print(widget.countyID);
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

              },
              child: Container(
                padding: const EdgeInsets.only(right: 25),
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              )
          ),
        ],
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: const Text(
            'Our Partners',
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F6F9),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: partner.length,
          itemBuilder: (BuildContext context, int index) {
            return buildCard(index);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0 / 1,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              partner[index].pictures,
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
        ],
      ),
    );
  }
}

