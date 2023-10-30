import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../../utils/size_config.dart';
import 'section_title.dart';

class WastePlayerMap extends StatefulWidget {
  const WastePlayerMap({Key? key}) : super(key: key);

  @override
  State<WastePlayerMap> createState() => _WastePlayerMapState();
}

class _WastePlayerMapState extends State<WastePlayerMap> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
    // ..setNavigationDelegate(
    //   NavigationDelegate(
    //     onProgress: (int progress) {
    //       // Update loading bar.
    //     },
    //     onPageStarted: (String url) {},
    //     onPageFinished: (String url) {},
    //     onWebResourceError: (WebResourceError error) {},
    //     onNavigationRequest: (NavigationRequest request) {
    //       if (request.url.startsWith('https://www.youtube.com/')) {
    //         return NavigationDecision.prevent;
    //       }
    //       return NavigationDecision.navigate;
    //     },
    //   ),
    // )
      ..loadRequest(Uri.parse('https://ckenspynner.github.io/Waste-Resource-Player/'));
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(20) ),
          child: const Text('Waste Players Interactive Map',),//SectionTitle(title: "Waste Players Map", press: () {}),
        ),

        SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            child: WebViewWidget(controller: controller),
          ),
        ),
      ],
    );
  }
}
