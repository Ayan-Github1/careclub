import 'package:careclub/Model/provider.dart';
import 'package:careclub/Model/user_details.dart';
import 'package:careclub/View/Screens/donation_screen.dart';
import 'package:careclub/View/Screens/feed_screen.dart';
import 'package:careclub/View/Screens/profile_screen.dart';
import 'package:careclub/View/Screens/search_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/post_image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  List<Widget> homeScreenItems = [
    FeedScreen(),
    const SearchScreen(),
    const DonationScreen(), // only for now instead of this activity will be implemented in future
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // UserDetails user =
    //     Provider.of<UserProvider>(context, listen: false).getUser;

    //CODE HAS BEEN SHIFTED TO FEED SCREEN FILE BECAUSE OF BOTTOM NAVIGATION IMPLEMENTATION.
    //ALL POSTS SCREEN WAS HOME SCREEN ITSELF AND IN NAVIGATION HOME CLASS WAS CALLED FROM HOME CLASS
    //SINCE WE NEED TO TRAVEL TO HOME SCREEN FROM ANOTHER SCREEN THROUGH BOTTOM NAV
    //CALLING SAME CLASS PROBLEM WAS OCCURRING
    //SO SEPERATE IMPLEMENTATION IS PROVIDED FOR POST VIEWING

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? btnColor : unselectedColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (_page == 1) ? btnColor : unselectedColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: (_page == 2) ? btnColor : unselectedColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 3) ? btnColor : unselectedColor,
            ),
            label: "",
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}

// const Text("user.email"),
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
