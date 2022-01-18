import 'package:careclub/Model/user_details.dart';
import 'package:careclub/ViewModel/auth_methods.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserDetails? _user;
  final AuthMethods _authMethods = AuthMethods();

  UserDetails get getUser => _user!;

  Future<void> refreshUser() async {
    UserDetails user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
