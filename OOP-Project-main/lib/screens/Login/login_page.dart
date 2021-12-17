import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import 'package:petservice_oop_app/shared/widget/link_widget.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controller;
  TextEditingController textEditingControllerEmail, textEditingControllerSenha;

  @override
  void initState() {
    controller = LoginController();
    textEditingControllerEmail = TextEditingController();
    textEditingControllerSenha = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          toolbarHeight: 0,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
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
                            child: Text('Olá,', style: AppTextStyles.signTitle),
                          ),
                          SizedBox(height: 13),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Faça login para continuar',
                              style: AppTextStyles.signSubTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 7),
                          child: TextInputWidget(
                              textEditingController: textEditingControllerEmail,
                              hintText: "Email",
                              inputType: TextInputType.emailAddress),
                        ),
                        SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 7),
                          child: TextInputWidget(
                              textEditingController: textEditingControllerSenha,
                              hintText: "Senha",
                              isPassword: true,
                              inputType: TextInputType.text),
                        ),
                      ]),
                    ),
                    SizedBox(height: 18),
                    Align(
                        alignment: Alignment.centerRight,
                        child: LinkWidget(
                            onTap: () =>
                                controller.onClickResetPassword(context),
                            text: "Esqueceu a senha?")),
                    Padding(
                      padding: const EdgeInsets.only(top: 29),
                      child: Column(children: <Widget>[
                        ButtonWidget(
                            text: "Login",
                            gradient: AppGradient.purple,
                            textStyle: AppTextStyles.buttonLarge,
                            onCLick: () {
                              controller.onClickHomeClient(context);
                              /* controller.signUpModel.email =
                                  textEditingControllerEmail.text;
                              controller.signUpModel.password =
                                  textEditingControllerSenha.text;
                              controller.login();
                              textEditingControllerEmail.clear();
                              textEditingControllerSenha.clear(); */
                            }),
                        SizedBox(height: 27),
                        ButtonWidget(
                            text: "Conectar com Google",
                            gradient: AppGradient.orange,
                            textStyle: AppTextStyles.buttonLarge,
                            onCLick: () async {
                              GoogleSignIn _googleSignIn = GoogleSignIn(
                                scopes: [
                                  'email',
                                ],
                              );
                              try {
                                final response = await _googleSignIn.signIn();
                                print(response);
                              } catch (error) {
                                print(error);
                              }
                            }),
                        SizedBox(height: 14),
                        ButtonWidget(
                          text: "Conectar com Facebook",
                          gradient: AppGradient.blue,
                          textStyle: AppTextStyles.buttonLarge,
                          onCLick: () => print("Conectar com Facebook"),
                        ),
                      ]),
                    ),
                    SizedBox(height: 36),
                    Center(
                      child: LinkWidget(
                          onTap: () => controller.byClickingRegister(context),
                          text: "Não tem uma conta? Cadastre-se"),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
