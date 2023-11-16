import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/data_service/products/userservice.dart';
import 'package:takaconnect/main.dart';
import 'package:takaconnect/screens/home/home_screen.dart';
import 'package:takaconnect/utils/constants.dart';
import 'package:takaconnect/utils/http_strings.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'package:http/http.dart' as http;

class LoginSuccessScreen extends StatefulWidget {
  final String? PhoneNumber;
  final String? CountyName;
  static String routeName = "/login_success";

  const LoginSuccessScreen({
    Key? key,
    this.PhoneNumber,
    this.CountyName,
  }) : super(key: key);

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  UserListService listOfUserService = UserListService();
  late List<UserList> userList;
  var arguments;

  late int id;
  late String firstname,
      lastname,
      contact,
      accounttype,
      county,
      subcounty,
      gender;

  Future<void> loggedAcountNumber(contact, county) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('loggedAccNumber', contact);
    pref.setString('loggedAccCounty', county);
  }

  bool terms = false;

// By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;
  int changerValue = 1;
  String welcomeName = '';

  // This function is triggered when the button is clicked
  ///---------------------------------------------------------------SAVE USER TO DJANGO------------------

  registerUser(token, firstname, lastname, contact, accounttype, county,
      subcounty, gender) async {
    //print(arguments['gender']);
    var path;

    if (county == 'Mombasa') {
      //works
      path = createmombasaUserListUrl;
    }
    if (county == 'Lamu') {
      //works
      path = createlamuUserListUrl;
    }
    if (county == 'Kwale') {
      //works
      path = createkwaleUserListUrl;
    }
    if (county == 'Kilifi') {
      //works
      path = createkilifiUserListUrl;
    }
    if (county == 'Tana River') {
      //works
      path = createtanariverUserListUrl;
    }
    if (county == 'Taita Taveta') {
      //works
      path = createtaitatavetaUserListUrl;
    }

    //print(path);

    var uri = Uri.parse(path);

    ///--------------------create mombasa produce seller
    Map data = {
      'firstname': '$firstname'.toTitleCase(),
      'lastname': '$lastname'.toTitleCase(),
      'contact': '$contact',
      'accounttype': '$accounttype',
      'county': '$county',
      'subcounty': '$subcounty',
      'gender': '$gender',
    };

    var response = await http.post(uri, body: data, headers: {
      'Authorization': ' Token $token',
    });
    //print(response.body.length);
    // if (error != null) {
    //   Get.showSnackbar(GetSnackBar(message: error.toString(),));
    // }

    if (response.statusCode == 200) {
      setState(() {
        terms = true;
      });
      loggedAcountNumber(contact, county);
    } else {
      final snackBar = SnackBar(
        content: const Text(
          'Something went wrong\n\n1. Make sure you have an internet connection\n2. The number your provided already have an account.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.redAccent,
        elevation: 1000,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 155,
            left: 10,
            right: 10),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  ///---------------------------------------------------------------END OF SAVE CODE---------------------

  @override
  Widget build(BuildContext context) {
    arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    // terms == arguments['term']
    // print(arguments['welcomeTitle']);
    // print(widget.PhoneNumber);
    // print(widget.CountyName);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: terms == false
            ? Text(arguments['appBarTitle'] ?? '')
            : const Text('Registration Successful'),
        centerTitle: true,
      ),
      //body: Body(),
      body: terms != arguments['term']
          ? SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Image.asset(
                    //"assets/images/successpic.png",
                    "assets/images/SuccessLoggedIn.png",
                    height: SizeConfig.screenHeight * 0.4, //40%
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text(
                    //"Login Success",
                    arguments['welcomeTitle'] ?? 'Welcome Back', //
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Visibility(
                    visible: widget.PhoneNumber == null ? true : false,
                    child: const Spacer(),
                  ),
                  FutureBuilder<ListOfUsers>(
                    future: listOfUserService
                        .getUserList(arguments['county'] ?? widget.CountyName),
                    builder: (context, snapshot) {
                      List<UserList>? userList = snapshot.data?.userList;

                      if (snapshot.hasError) {
                        return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    'assets/images/error404.png',
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(100),
                                ),
                                const Text(
                                  '\nSomething went wrong\n\nMake sure you are having an\ninternet connection',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ));
                      }
                      if (snapshot.hasData) {
                        return Wrap(direction: Axis.vertical, children: [
                          ...?userList?.map((user) {
                            if (arguments['contact'] != null
                                ? user.contact == arguments['contact']
                                : user.contact == widget.PhoneNumber) {
                              id = user.id;
                              firstname = user.firstname;
                              lastname = user.lastname;
                              contact = user.contact;
                              accounttype = user.accounttype;
                              county = user.county;
                              subcounty = user.subcounty;
                              gender = user.gender;
                            } //print(user.id);

                            // if (arguments['contact'] == null) {
                            //   return Text(
                            //     //"Login Success",
                            //     user.firstname,
                            //     style: TextStyle(
                            //       fontSize: getProportionateScreenWidth(10),
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.black,
                            //     ),
                            //   );
                            // }

                            if (arguments['contact'] != null) {
                              return user.contact == arguments['contact']
                                  ? SizedBox(
                                      width: SizeConfig.screenWidth * 0.6,
                                      child: DefaultButton(
                                        text: "Back to home",
                                        press: () {
                                          //loggedAcountNumber();
                                          Navigator.pushNamed(
                                            context,
                                            HomeScreen.routeName,
                                            arguments: {
                                              'id': '$id',
                                              'firstname': firstname,
                                              'lastname': lastname,
                                              'contact': contact,
                                              'accounttype': accounttype,
                                              'county': county,
                                              'subcounty': subcounty,
                                              'gender': gender
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            } else {
                              return user.contact == widget.PhoneNumber
                                  ? SizedBox(
                                      width: SizeConfig.screenWidth * 0.6,
                                      child: Column(
                                        children: [
                                          Text(
                                            //"Login Success",
                                            user.firstname,
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      30),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  getProportionateScreenWidth(
                                                      60)),
                                          DefaultButton(
                                            text: "Back to home",
                                            press: () {
                                              //loggedAcountNumber();
                                              Navigator.pushNamed(
                                                context,
                                                HomeScreen.routeName,
                                                arguments: {
                                                  'id': '$id',
                                                  'firstname': firstname,
                                                  'lastname': lastname,
                                                  'contact': contact,
                                                  'accounttype': accounttype,
                                                  'county': county,
                                                  'subcounty': subcounty,
                                                  'gender': gender
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            }
                            // return user.contact == arguments['contact']
                            //     ? SizedBox(
                            //         width: SizeConfig.screenWidth * 0.6,
                            //         child: DefaultButton(
                            //           text: "Back to home",
                            //           press: () {
                            //             //loggedAcountNumber();
                            //             Navigator.pushNamed(
                            //               context,
                            //               HomeScreen.routeName,
                            //               arguments: {
                            //                 'id': '$id',
                            //                 'firstname': firstname,
                            //                 'lastname': lastname,
                            //                 'contact': contact,
                            //                 'accounttype': accounttype,
                            //                 'county': county,
                            //                 'subcounty': subcounty,
                            //                 'gender': gender
                            //               },
                            //             );
                            //           },
                            //         ),
                            //       )
                            //     : const SizedBox.shrink();
                          }).toList(),
                        ]);
                      } else {
                        return Column(
                          children: [
                            const Text('Finalizing...'),
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: const Center(
                                  child: LinearProgressIndicator(
                                backgroundColor: Color(0xFFB4B4B4),
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.green),
                              )),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  // SizedBox(
                  //   width: SizeConfig.screenWidth * 0.6,
                  //   child: DefaultButton(
                  //     text: "Back to home",
                  //     press: () {
                  //       Navigator.pushNamed(context, HomeScreen.routeName);
                  //     },
                  //   ),
                  // ),
                  const Spacer(),
                ],
              ),
            )
          : SingleChildScrollView(
        scrollDirection: Axis.vertical,
            child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(children: [
                          const Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 20,bottom: 20),
                              child: Column(
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ultricies maximus ipsum a egestas. Etiam tincidunt nunc neque, et ornare nisi luctus ut. \n\nPellentesque ut varius metus. Proin efficitur sagittis leo, posuere eleifend velit fermentum at. Mauris at purus vitae ex tempus aliquam. Praesent lacinia, diam at ornare ultricies, nunc libero viverra mi, quis lacinia augue libero in tortor. \n\nIn sodales mauris sem, vitae auctor nibh vulputate nec. Aliquam vulputate fringilla justo, commodo lobortis ligula efficitur ac. Donec vehicula dignissim auctor. Sed nec bibendum ipsum. \n\nUt efficitur nisi eu posuere pellentesque. Aenean aliquet nisl vitae lorem vulputate laoreet. Phasellus ut sem dictum, aliquet ligula eu, consectetur ligula. Aliquam auctor tellus id molestie fermentum.\n\nAenean et turpis eros. Etiam dictum sed neque et consectetur. Proin ac felis erat. Pellentesque eget vestibulum massa, eu eleifend odio. Nulla facilisi. Donec sollicitudin nisi id arcu semper auctor. Donec et lacus eget nisl malesuada porttitor. \n\nQuisque imperdiet, risus non auctor blandit, dolor massa elementum nunc, malesuada suscipit mi odio vel nulla. Phasellus vehicula, massa ut elementum euismod, sem velit convallis mauris, consectetur tempor eros est a est. \n\nDonec ut vehicula augue. Donec lacinia euismod diam faucibus dapibus. Cras varius sit amet lorem eget mattis. Etiam id maximus magna. Maecenas interdum aliquam ipsum, at fringilla nisl pretium eget. \n\nPhasellus felis orci, scelerisque in sodales in, porta ac nisl. Aliquam mauris nunc, commodo eu tortor mollis, aliquam porta augue.',
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: getProportionateScreenWidth(20),
                          ),
                          Row(
                            children: [
                              Material(
                                child: Checkbox(
                                  activeColor: kPrimaryColor,
                                  //The color to use when this checkbox is checked.
                                  checkColor: Colors.white,
                                  value: agree,
                                  onChanged: (value) {
                                    setState(() {
                                      agree = value ?? false;
                                      //print(value);
                                    });
                                  },
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'I have read and accepted terms and conditions',
                                  //overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor),
                              ),
                              onPressed: agree
                                  ? () {
                                      registerUser(
                                          auth_token,
                                          arguments['firstname'],
                                          arguments['lastname'],
                                          arguments['contact'],
                                          arguments['accounttype'],
                                          arguments['county'],
                                          arguments['subcounty'],
                                          arguments['gender']);
                                    }
                                  : null,
                              child: const Text('Continue')),
                          SizedBox(
                            height: getProportionateScreenWidth(50),
                          ),
                        ]),
                        // DefaultButton(
                        //   text: "Accept",
                        //   press: agree ? _doSomething : null,
                        // ),
                      ]),
                ),
              ),
          ),
    );
  }
}
