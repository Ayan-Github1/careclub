import 'package:careclub/Model/provider.dart';
import 'package:careclub/Model/user_details.dart';
import 'package:careclub/View/Screens/donation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UserDetails user =
    //     Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // const Text("user.email"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DonationScreen(),
                    ),
                  );
                },
                child: const Text('Donation'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const DonationScreen(),
              //       ),
              //     );
              //   },
              //   child: const Text('Donation'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const DonationScreen(),
              //       ),
              //     );
              //   },
              //   child: const Text('Donation'),
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const DonationScreen(),
              //       ),
              //     );
              //   },
              //   child: const Text('Donation'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
