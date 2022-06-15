import 'package:careclub/Model/provider.dart';
import 'package:careclub/Model/user_details.dart';
import 'package:careclub/View/Screens/donation_screen.dart';
import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/post_image_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late PageController pageController;
  int _page = 0;
  Color primaryColor = Colors.blue;
  Color secondaryColor = Colors.grey;

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

  @override
  Widget build(BuildContext context) {
    UserDetails? userRole = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: btnColor,
        centerTitle: true,
        title: const Text("CARE CLUB"),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: userRole!.role == 'Admin' ? Icon(Icons.add) : Icon(Icons.dashboard_customize_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonationScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: ListView(
            children: [
              Column(
                children: const [
                  PostContainer(
                    url:
                        "https://images.unsplash.com/photo-1599059813005-11265ba4b4ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZG9uYXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PostContainer(
                    url:
                        "https://images.unsplash.com/photo-1593113598332-cd288d649433?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9uYXRpb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PostContainer(
                    url:
                        "https://images.unsplash.com/photo-1567113463300-102a7eb3cb26?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGRvbmF0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PostContainer(
                    url:
                        "https://images.unsplash.com/photo-1593113616828-6f22bca04804?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGRvbmF0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
