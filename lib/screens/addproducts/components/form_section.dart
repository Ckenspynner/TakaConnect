import 'dart:math';

import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/screens/addproducts/components/top_rounded_container.dart';
import 'package:takaconnect/utils/size_config.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _dropdownFormKey = GlobalKey<FormState>();
  int simpleIntInput = 0;

  String selectedValue1 = "Select Category";
  String selectedValue2 = "Select Category Type";
  String selectedValue3 = "Select Sub-County";

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category", child: Text("Select Category")),
      const DropdownMenuItem(
          value: "All Categories", child: Text("All Categories")),
      const DropdownMenuItem(value: "Plastics", child: Text("Plastics")),
      const DropdownMenuItem(value: "Rubber", child: Text("Rubber")),
      const DropdownMenuItem(value: "Organics", child: Text("Organics")),
      const DropdownMenuItem(value: "Paper", child: Text("Paper")),
      const DropdownMenuItem(value: "Glass", child: Text("Glass")),
      const DropdownMenuItem(value: "Metal", child: Text("Metal")),
      const DropdownMenuItem(value: "Clothes", child: Text("Clothes")),
      const DropdownMenuItem(value: "E_waste", child: Text("E_waste")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(value: "FP", child: Text("Food Product (FP)")),
      const DropdownMenuItem(
          value: "HP", child: Text("Household Product (HP)")),
      const DropdownMenuItem(value: "0", child: Text("Others (O)")),
      const DropdownMenuItem(value: "PC", child: Text("Personal Care (PC)")),
      const DropdownMenuItem(value: "SM", child: Text("Smoking Material (SM)")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownNull {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(
          value: "All Categories Types", child: Text("All Categories Types")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownClothes {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(
          value: "None synthetic (Cotton/Wool)",
          child: Text("None synthetic (Cotton/Wool)")),
      const DropdownMenuItem(value: "Synthetic", child: Text("Synthetic")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownEWaste {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(
          value: "Car Batteries", child: Text("Car Batteries")),
      const DropdownMenuItem(
          value: "Cooling Equipment", child: Text("Cooling Equipment")),
      const DropdownMenuItem(
          value: "Telecom Equipment", child: Text("Telecom Equipment")),
      const DropdownMenuItem(
          value: "Consumer Equipment", child: Text("Consumer Equipment")),
      const DropdownMenuItem(value: "Screens", child: Text("Screens")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownGlass {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(
          value: "Broken Glass", child: Text("Broken Glass")),
      const DropdownMenuItem(
          value: "Drinking Bottle", child: Text("Drinking Bottle")),
      const DropdownMenuItem(
          value: "Glassware/Jars", child: Text("Glassware/Jars")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownMetal {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(value: "Heavy", child: Text("Heavy")),
      const DropdownMenuItem(value: "Light", child: Text("Light")),
      const DropdownMenuItem(value: "Medium", child: Text("Medium")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownOrganics {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(value: "Bones", child: Text("Bones")),
      const DropdownMenuItem(
          value: "Coconut Husks", child: Text("Coconut Husks")),
      const DropdownMenuItem(
          value: "Kitchen Remains", child: Text("Kitchen Remains")),
      const DropdownMenuItem(value: "Saw Dust", child: Text("Saw Dust")),
      const DropdownMenuItem(value: "Manure", child: Text("Manure")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownPaper {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(value: "Cardboard", child: Text("Cardboard")),
      const DropdownMenuItem(
          value: "Magazine/Newspaper", child: Text("Magazine/Newspaper")),
      const DropdownMenuItem(
          value: "Office Paper", child: Text("Office Paper")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownPlastic {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(value: "HDPE", child: Text("HDPE")),
      const DropdownMenuItem(value: "LDPE", child: Text("LDPE")),
      const DropdownMenuItem(value: "PET", child: Text("PET")),
      const DropdownMenuItem(value: "PP", child: Text("PP")),
      const DropdownMenuItem(value: "PS", child: Text("PS")),
      const DropdownMenuItem(value: "PVC", child: Text("PVC")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownRubber {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Category Type", child: Text("Select Category Type")),
      const DropdownMenuItem(value: "Flip-Flop", child: Text("Flip-Flop")),
      const DropdownMenuItem(value: "Shoes/Soles", child: Text("Shoes/Soles")),
      const DropdownMenuItem(value: "Tyre", child: Text("Tyre")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Sub-County", child: Text("Select Sub-County")),
      const DropdownMenuItem(
          value: "All Sub-County", child: Text("All Sub-County")),
      const DropdownMenuItem(value: "Changamwe", child: Text("Changamwe")),
      const DropdownMenuItem(value: "Kisauni", child: Text("Kisauni")),
      const DropdownMenuItem(value: "Likoni", child: Text("Likoni")),
      const DropdownMenuItem(value: "Jomvu", child: Text("Jomvu")),
      const DropdownMenuItem(value: "Mvita", child: Text("Mvita")),
      const DropdownMenuItem(value: "Nyali", child: Text("Nyali")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownNull2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Sub-County", child: Text("Select Sub-County")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _dropdownFormKey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC4DFB4), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC4DFB4), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: (value) => value == "Select Category"
                            ? "Select Category"
                            : null,
                        //dropdownColor: Colors.blueAccent,
                        value: selectedValue1,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue1 = newValue!;
                            selectedValue2 = "Select Category Type";
                            selectedValue3 = "Select Sub-County";
                          });
                        },
                        items: dropdownItems1),
                    const SizedBox(
                      height: 30,
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC4DFB4), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC4DFB4), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        validator: (value) => value == "Select Category Type"
                            ? "Select Category Type"
                            : null,
                        //dropdownColor: Colors.blueAccent,
                        value: selectedValue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue2 = newValue!;
                            selectedValue3 = "Select Sub-County";
                          });
                        },
                        items: selectedValue1 == 'Plastics'
                            ? dropdownPlastic
                            : selectedValue1 == 'Rubber'
                            ? dropdownRubber
                            : selectedValue1 == 'Organics'
                            ? dropdownOrganics
                            : selectedValue1 == 'Paper'
                            ? dropdownPaper
                            : selectedValue1 == 'Glass'
                            ? dropdownGlass
                            : selectedValue1 == 'Metal'
                            ? dropdownMetal
                            : selectedValue1 == 'E_waste'
                            ? dropdownEWaste
                            : selectedValue1 ==
                            'Clothes'
                            ? dropdownClothes
                            : dropdownNull),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Quantity (QTY) in Kgs',
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(70),
                      width: double.infinity,
                      child: InputQty(
                        //color of the increase and decrease icon
                        maxVal: double.maxFinite,
                        //max val to go
                        initVal: 0,
                        decoration: QtyDecorationProps(
                          btnColor: Colors.green,
                          //contentPadding: EdgeInsets.all(18.0),
                          //border: InputBorder.none
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          width: 30,
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          } else if (value <= 0) {
                            return "Quantity can not be less than 0";
                          }
                          return null;
                        },
                        //min starting val
                        onQtyChanged: (val) {
                          //on value changed we may set the value
                          //setstate could be called
                        },
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(20.0),
                    ),
                    // TextFormField(
                    //   //controller: controllerCounts,
                    //   //keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     labelText: 'Location',
                    //     hintText: 'e.g Kisauni',
                    //     suffixIcon: IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(
                    //         Icons.category,
                    //       ),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Enter Location Details";
                    //     } else {
                    //       //   if (int.parse(controllerCounts.text) <= 0) {
                    //       //     return "Total Counts can't be 0 or Less than 0";
                    //       //   } else {
                    //       //     return null;
                    //       //   }
                    //     }
                    //   },
                    // ),
                    // SizedBox(
                    //   height: getProportionateScreenWidth(30.0),
                    // ),
                    // TextFormField(
                    //   //controller: controllerCounts,
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //     labelText: 'Phone Number',
                    //     hintText: 'e.g 0712345678',
                    //     suffixIcon: IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(
                    //         Icons.phone_android_rounded,
                    //       ),
                    //     ),
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Enter Phone Number";
                    //     } else {
                    //       if (value.length < 0 || value.length > 10) {
                    //         return "Total Counts can't be 0 or Less than 0";
                    //       } else {
                    //         return null;
                    //       }
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(60),
                  left: getProportionateScreenWidth(20),
                  right: getProportionateScreenWidth(20),
                  //vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            // if (orderText == 'Order') {
                            //   _show_order_panel = !_show_order_panel;
                            //   chatText = 'Close';
                            //   orderText = 'Submit';
                            // } else {
                            //   if (_dropdownFormKey.currentState!.validate()) {
                            //     _show_order_panel = !_show_order_panel;
                            //     chatText = 'Chat';
                            //     orderText = 'Order';
                            //   }
                            // }
                          });
                        },
                        child: Container(
                          color: const Color(0xFFC4DFB4),
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: 15,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Submit Order',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ), //color: kPrimaryColor),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.shopping_cart_checkout_sharp,
                                size: 12,
                                color: Colors.white,
                                //color: kPrimaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
