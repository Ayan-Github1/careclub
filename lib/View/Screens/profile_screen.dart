import 'package:careclub/View/Screens/donation_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/material_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("PROFILE"),
        backgroundColor: btnColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: hintColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "USERNAME",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: (() {}),// implement this if some things are needed to be added
                    child: const Icon(Icons.more_vert_rounded),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                "Donations till now",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
              const Center(
                child: Text("12"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Contact: +91 4324234324"),
              const SizedBox(
                height: 20,
              ),
              const Text("Email: Example@emial.com"),
              const SizedBox(
                height: 20,
              ),
              const Text("Address: "),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: MaterialBtn(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: btnColor,
                  text: "DONATE",
                  radius: 18,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DonationScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: MaterialBtn(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: btnColor,
                  text: "LOGOUT",
                  radius: 18,
                  function: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
