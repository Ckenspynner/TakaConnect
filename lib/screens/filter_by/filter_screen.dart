import 'package:flutter/material.dart';
import 'package:takaconnect/components/default_button.dart';
import 'package:takaconnect/utils/size_config.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filter";

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  String selectedValue1 = "Select Type of Product";
  String selectedValue2 = "Select Type of Material";
  String selectedValue3 = "Select Type of Layer";

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownItems1 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Type of Product",
          child: Text("Select Type of Product")),
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
  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Type of Material",
          child: Text("Select Type of Material")),
      const DropdownMenuItem(
          value: "HDPE", child: Text("High Density Polyethylene (HDPE)")),
      const DropdownMenuItem(
          value: "LDPE", child: Text("Low Density Polyethylene (LDPE)")),
      const DropdownMenuItem(value: "O", child: Text("Others (O)")),
      const DropdownMenuItem(
          value: "PET", child: Text("Polyethylene Terephthalate (PET)")),
      const DropdownMenuItem(value: "PP", child: Text("Polyethylene (PP)")),
      const DropdownMenuItem(value: "PVC", child: Text("Polyvinylchloride (PVC)")),
    ];
    return menuItems;
  }

  //Dropdown parameters definition
  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "Select Type of Layer", child: Text("Select Type of Layer")),
      const DropdownMenuItem(value: "SL", child: Text("Single Layer (SL)")),
      const DropdownMenuItem(value: "ML", child: Text("Multi Layer (ML)")),
    ];
    return menuItems;
  }

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
            child: Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ),
        title: Text("Filters",
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
          color: Color(0xFFF2F3F2),
          borderRadius: BorderRadius.circular(30),
        ),
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
                validator: (value) =>
                value == "Select Type of Product"
                    ? "Select Type of Product"
                    : null,
                //dropdownColor: Colors.blueAccent,
                value: selectedValue1,
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue1 = newValue!;
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
                validator: (value) =>
                value == "Select Type of Product"
                    ? "Select Type of Product"
                    : null,
                //dropdownColor: Colors.blueAccent,
                value: selectedValue1,
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue1 = newValue!;
                  });
                },
                items: dropdownItems1),
            const SizedBox(
              height: 30,
            ),
            // DropdownButtonFormField(
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //             color: Colors.greenAccent, width: 2),
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       border: OutlineInputBorder(
            //         borderSide: const BorderSide(
            //             color: Colors.greenAccent, width: 2),
            //         borderRadius: BorderRadius.circular(20),
            //       ),
            //       filled: true,
            //       fillColor: Colors.transparent,
            //     ),
            //     validator: (value) =>
            //     value == "Select Type of Material"
            //         ? "Select Type of Material"
            //         : null,
            //     //dropdownColor: Colors.blueAccent,
            //     value: selectedValue2,
            //     icon: const Icon(Icons.keyboard_arrow_down),
            //     onChanged: (String? newValue) {
            //       setState(() {
            //         selectedValue2 = newValue!;
            //       });
            //     },
            //     items: dropdownItems2),
            // const SizedBox(
            //   height: 30,
            // ),
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
                validator: (value) =>
                value == "Select Type of Layer"
                    ? "Select Type of Layer"
                    : null,
                //dropdownColor: Colors.blueAccent,
                value: selectedValue3,
                icon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue3 = newValue!;
                  });
                },
                items: dropdownItems3),
            const SizedBox(
              height: 30,
            ),
            // getLabel("Categories"),
            // SizedBox(height: 15),
            // OptionItem(text: "Eggs"),
            // SizedBox(height: 15),
            // OptionItem(text: "Noodles & Pasta"),
            // SizedBox(height: 15),
            // const OptionItem(text: "Chips & Crisps"),
            // const SizedBox(height: 15),
            // OptionItem(text: "Fast Food"),
            // SizedBox(height: 30),
            // getLabel("Brand"),
            // SizedBox(height: 15),
            // OptionItem(text: "Individual Collection"),
            // SizedBox(height: 15),
            // OptionItem(text: "Cocacola"),
            // SizedBox(height: 15),
            // OptionItem(text: "Ifad"),
            // SizedBox(height: 15),
            // OptionItem(text: "Kazi Formas"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.6,
                  child: DefaultButton(
                    text: "Apply Filter",
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class OptionItem extends StatefulWidget {
  final String text;

  const OptionItem({Key? key, required this.text}) : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checked = !checked;
        });
      },
      child: Container(
        child: Row(
          children: [
            getCheckBox(),
            const SizedBox(
              width: 12,
            ),
            getTextWidget(),
          ],
        ),
      ),
    );
  }

  Widget getTextWidget() {
    return Text(
      widget.text,
      style: TextStyle(
        color: checked ? Colors.greenAccent : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget getCheckBox() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: SizedBox(
        width: 25,
        height: 25,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: checked ? 0 : 1.5, color: Color(0xffB1B1B1)),
              borderRadius: BorderRadius.circular(8),
              color: checked ? Colors.greenAccent : Colors.transparent),
          child: Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.transparent,
            ),
            child: Checkbox(
              value: checked,
              onChanged: (state) => setState(() => checked = !checked),
              activeColor: Colors.transparent,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.padded,
            ),
          ),
        ),
      ),
    );
  }
}
