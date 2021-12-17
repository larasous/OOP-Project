import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/Login/login_page.dart';

class SplashScreenController {
  void onClickLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}
