import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petservice_oop_app/core/app_colors.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/SignUp2/sign2_page.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';
import 'register_controller.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var controller;

  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  void initState() {
    controller = RegisterController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ScaffoldMessenger(
            key: scaffoldMessengerKey,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 0,
              ),
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 59),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Cadastro',
                                  style: AppTextStyles.splashTitle),
                            ),
                            SizedBox(height: 13),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Escolha um modo de login',
                                style: AppTextStyles.signSubTitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 45),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: TextInputWidget(
                                  textEditingController:
                                      controller.textEditingControllerEmail,
                                  hintText: "Email",
                                  inputType: TextInputType.text),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7, bottom: 7),
                              child: TextInputWidget(
                                  textEditingController:
                                      controller.textEditingControllerSenha,
                                  hintText: "Senha",
                                  isPassword: true,
                                  inputType: TextInputType.text),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.only(top: 29),
                        child: Column(
                          children: <Widget>[
                            ButtonWidget(
                                text: "Seguir",
                                gradient: AppGradient.purple,
                                textStyle: AppTextStyles.buttonLarge,
                                onCLick: () => {
                                      controller.onClickSignUp(context),
                                    }),
                            SizedBox(height: 50),
                            ButtonWidget(
                              text: "Conectar com Google",
                              gradient: AppGradient.orange,
                              textStyle: AppTextStyles.buttonLarge,
                              onCLick: () => print("Conectar com Google"),
                            ),
                            SizedBox(height: 14),
                            ButtonWidget(
                              text: "Conectar com Facebook",
                              gradient: AppGradient.blue,
                              textStyle: AppTextStyles.buttonLarge,
                              onCLick: () => print("Conectar com Facebook"),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )),
            )));
  }

  void onSucess() {
    scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text('Usuário criado!'),
      backgroundColor: AppColors.backgroundColor,
      duration: Duration(seconds: 2),
    ));
  }

  void onFail() {
    scaffoldMessengerKey.currentState.showSnackBar(SnackBar(
      content: Text('Falha ao criar a conta, email já em uso'),
      backgroundColor: AppColors.backgroundColor,
      duration: Duration(seconds: 2),
    ));
  }
}
