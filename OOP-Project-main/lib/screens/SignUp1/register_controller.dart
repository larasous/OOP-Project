import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/SignUp2/sign2_page.dart';
import 'package:petservice_oop_app/shared/model/signUp_model.dart';

class RegisterController extends SignUp {
  TextEditingController textEditingControllerEmail, textEditingControllerSenha;

  RegisterController() {
    textEditingControllerEmail = TextEditingController();
    textEditingControllerSenha = TextEditingController();
  }

  void onClickSignUp(
    BuildContext context,
  ) async {
    User user = await SignUp.registerUsingEmailPassword(
      email: textEditingControllerEmail.text,
      password: textEditingControllerSenha.text,
    );
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignupPage2()));
    }
  }
}
