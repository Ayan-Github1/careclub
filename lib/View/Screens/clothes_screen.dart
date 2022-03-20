import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClothesScreen extends StatefulWidget {
  ClothesScreen({Key? key}) : super(key: key);

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  String dropValue = '--Select--';

  var items = [
    '--Select--',
    'Trousers',
    'T-Shirts',
    'Shirts',
    'Shoes',
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController _locationController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("CLOTHES"),
          backgroundColor: btnColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  "GIVE US SOME DETAILS",
                  style: TextStyle(fontSize: 40),
                ),
                Container(
                  height: 5.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InputFormField(
                  hint: 'Location',
                  label: 'Pick Up Location',
                  radius: 15,
                  icon: Icons.location_pin,
                  errorMessage: 'Please enter this field',
                  generalController: _locationController,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 50,
                  width: 350,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: hintColor,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: DropdownButtonHideUnderline(
                      child: Container(),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    value: dropValue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          dropValue = newValue!;
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: MaterialBtn(
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: btnColor,
                    text: 'DONE',
                    radius: 18,
                    function: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
