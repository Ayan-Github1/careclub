import 'dart:async';

import 'package:careclub/Model/provider.dart';
import 'package:careclub/View/Screens/front_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FrontScreen(),
      ),
    );
  }
}

