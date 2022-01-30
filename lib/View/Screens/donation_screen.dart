import 'package:careclub/View/Screens/clothes_screen.dart';
import 'package:careclub/View/Screens/food_screen.dart';
import 'package:careclub/View/Screens/payments_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/grid_view_container.dart';
import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation'),
        backgroundColor: btnColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'HOW DO YOU WANT TO HELP',
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
            Container(
              height: 350.0,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ),
                    ),
                    child: const GridContainer(
                      icon: Icons.money,
                      text: 'Money',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClothesScreen(),
                      ),
                    ),
                    child: const GridContainer(
                      icon: Icons.shopping_bag,
                      text: 'Clothes',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodScreen(),
                      ),
                    ),
                    child: const GridContainer(
                      icon: Icons.food_bank,
                      text: 'Food',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ),
                    ),
                    child: const GridContainer(
                      icon: Icons.money,
                      text: 'Help',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
