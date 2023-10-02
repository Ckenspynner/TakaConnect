import 'package:flutter/material.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/screens/product_sellers/sellers.dart';
import 'package:takaconnect/utils/size_config.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filter";

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
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

  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Filters",
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3F2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Form(
          key: _dropdownFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) =>
                      value == "Select Category" ? "Select Category" : null,
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
                      borderSide:
                          const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFFC4DFB4), width: 2),
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
                                              : selectedValue1 == 'Clothes'
                                                  ? dropdownClothes
                                                  : dropdownNull),
              const SizedBox(
                height: 30,
              ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xFFC4DFB4), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) =>
                      value == "Select Sub-County" ? "Select Sub-County" : null,
                  //dropdownColor: Colors.blueAccent,
                  value: selectedValue3,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue3 = newValue!;
                    });
                  },
                  items: selectedValue2 == "Select Category Type"
                      ? dropdownNull2
                      : dropdownItems3),
              const SizedBox(
                height: 30,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.6,
                    child: DefaultButton(
                      text: "Apply Filter",
                      press: () {
                        if (_dropdownFormKey.currentState!.validate()) {
                          Navigator.pushNamed(
                            context,
                            SellerScreen.routeName,
                            arguments: {
                              'barTitle': selectedValue1 == 'All Categories'
                                  ? 'Product List'
                                  : '$selectedValue1 Sellers'
                            },
                          );
                          //Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
