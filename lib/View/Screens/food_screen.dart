import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _locationController = TextEditingController();
    TextEditingController _quantityController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("FOOD"),
        backgroundColor: btnColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
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
                height: 30.0,
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
              InputFormField(
                hint: 'Quantity',
                label: 'Quantity',
                radius: 15,
                icon: Icons.production_quantity_limits,
                errorMessage: 'Please enter this field',
                generalController: _quantityController,
                textInputType: TextInputType.text,
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
      ),
    );
  }
}
