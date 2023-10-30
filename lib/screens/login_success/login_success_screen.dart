import 'package:flutter/material.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/data_service/products/userservice.dart';
import 'package:takaconnect/main.dart';
import 'package:takaconnect/screens/home/home_screen.dart';
import 'package:takaconnect/utils/constants.dart';
import 'package:takaconnect/utils/http_strings.dart';
import 'package:takaconnect/utils/size_config.dart';
import 'package:http/http.dart' as http;

class LoginSuccessScreen extends StatefulWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen> {
  UserListService listOfUserService = UserListService();
  late List<UserList> userList;
  var arguments;

  // Future<void> LoggedAcountNumber() async {
  //   SharedPreferences prefs =await SharedPreferences.getInstance();
  //
  //     SharedPreferences pref =await SharedPreferences.getInstance();
  //     //pref.setString('isLogin', '+254702407935');
  //     //pref.remove('isLogin');
  //
  //     arguments['contact'] =pref.getString('isLogin');
  //     print('$arguments['contact']');
  //
  //
  // }

  late int id;
  late String firstname,
      lastname,
      contact,
      accounttype,
      county,
      subcounty,
      gender;

  //
  // Future<void> loggedAcountNumber() async {
  //
  //   SharedPreferences pref =await SharedPreferences.getInstance();
  //   pref.setInt('id', id);
  //   pref.setString('firstname', firstname);
  //   pref.setString('lastname', lastname);
  //   pref.setString('contact', contact);
  //   pref.setString('accounttype', accounttype);
  //   pref.setString('county', county);
  //   pref.setString('subcounty', subcounty);
  //   pref.setString('gender', gender);
  //
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   LoggedAcountNumber();
  //   super.initState();
  // }
  bool terms = false;

// By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;
  int changerValue = 1;

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
      // final snackBar = SnackBar(
      //   content: const Text('Account created Successfully'),
      //   behavior: SnackBarBehavior.floating,
      //   dismissDirection: DismissDirection.up,
      //   backgroundColor: Colors.green, elevation: 1000,
      //   margin: EdgeInsets.only(
      //       bottom: MediaQuery.of(context).size.height - 70,
      //       left: 10,
      //       right: 10),
      //   // action: SnackBarAction(
      //   //   textColor: Colors.white,
      //   //   label: 'Undo',
      //   //   onPressed: () {
      //   //     // Some code to undo the change.
      //   //   },
      //   // ),
      // );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      //ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        content: const Text(
            'Something went wrong\n\n1. Make sure you have an internet connection\n2. The number your provided already have an account.',textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.redAccent, elevation: 1000,
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
    //terms == arguments['term']
    //print(arguments['county']);
    // print(arguments['term']);
    // print(terms);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(arguments['appBarTitle']),
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
                    "assets/images/success.png",
                    height: SizeConfig.screenHeight * 0.4, //40%
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text(
                    "Login Success",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  FutureBuilder<ListOfUsers>(
                    future: listOfUserService.getUserList(arguments['county']),
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
                            if (user.contact == arguments['contact']) {
                              id = user.id;
                              firstname = user.firstname;
                              lastname = user.lastname;
                              contact = user.contact;
                              accounttype = user.accounttype;
                              county = user.county;
                              subcounty = user.subcounty;
                              gender = user.gender;
                            } //print(user.contact);
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
                                            'id': id,
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
          : SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  'I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions I have read and accept terms and conditions',
                                  //overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: getProportionateScreenWidth(100),
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
                                'I have read and accept terms and conditions',
                                //overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryColor),
                              //padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                              //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
                            ),
                            onPressed: agree
                                ? () {
                                    registerUser(
                                        '428086bf6b4d116807f29f130788e3401c2b8377',
                                        arguments['firstname'],
                                        arguments['lastname'],
                                        arguments['contact'],
                                        arguments['accounttype'],
                                        arguments['county'],
                                        arguments['subcounty'],
                                        arguments['gender']);


                                  }
                                : null,
                            child: const Text('Continue'))
                      ]),
                      // DefaultButton(
                      //   text: "Accept",
                      //   press: agree ? _doSomething : null,
                      // ),
                    ]),
              ),
            ),
    );
  }
}
