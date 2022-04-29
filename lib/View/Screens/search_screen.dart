import 'package:careclub/View/Utilities/colors.dart';
import 'package:careclub/View/Utilities/text_field.dart';
import 'package:flutter/material.dart';
import 'package:ms_undraw/ms_undraw.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final InputDecoration deco = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: btnColor),
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    prefixIcon: const Icon(Icons.search),
    suffixIcon: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.cancel),
    ),
    hintText: "Search to find",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  // WHENEVER A TEXT IS ENTERED IN SEARCH FIELD RUN A SEARCH QUERY AND DISPLAY THE RESULT IN CLICKABLE LIST TILES AS BELOW DUMMY DATA
                  decoration: deco,
                  controller: _searchController,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView(
                    children: [
                      ListTile(
                        title: const Text("data"),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text("data"),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text("data"),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text("data"),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
