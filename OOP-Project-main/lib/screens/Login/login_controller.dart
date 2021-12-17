import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/HomeClient/home_page.dart';
import 'package:petservice_oop_app/screens/ResetPassword/rstpass_page.dart';
import '../SignUp1/register_page.dart';
import 'package:petservice_oop_app/shared/model/signUp_model.dart';

class LoginController extends ChangeNotifier {
  SignUp signUpModel;

  LoginController() {
    signUpModel = SignUp();
  }

  void byClickingRegister(BuildContext context) {
    print(signUpModel.email);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  void onClickResetPassword(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResetPage()));
  }

  void onClickHomeClient(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeClientPage()));
  }
}
