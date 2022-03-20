import 'package:careclub/View/Utilities/colors.dart';
import 'package:flutter/material.dart';

class Verfication extends StatefulWidget {
  const Verfication({Key? key}) : super(key: key);

  @override
  _VerficationState createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(primary: btnColor),
              onPressed: () {},
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Document 1"),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(primary: btnColor),
              onPressed: () {},
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Document 2"),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(primary: btnColor),
              onPressed: () {},
              icon: const Icon(Icons.upload_file),
              label: const Text("Upload Document 2"),
            ),
          ],
        ),
      ),
    );
  }
}
