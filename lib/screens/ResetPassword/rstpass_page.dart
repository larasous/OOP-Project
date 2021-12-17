import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';


class ResetPage extends StatefulWidget {
  ResetPage({Key key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  var controller;
  TextEditingController textEditingControllerEmail;

  @override
  void initState() {
    //controller = ResetController();
    textEditingControllerEmail = TextEditingController();
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
                            child:
                                Text('Reset', style: AppTextStyles.signTitle),
                          ),
                          SizedBox(height: 13),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Perdeu sua senha?',
                              style: AppTextStyles.signSubTitle,
                            ),
                          ),
                        ],
                      ),
                    ), // Título e Subtítulo
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Column(children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 7),
                            child: TextInputWidget(
                                textEditingController:
                                    textEditingControllerEmail,
                                hintText: "Email",
                                inputType: TextInputType.emailAddress)),
                        Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: ButtonWidget(
                              text: "Enviar recuperação",
                              gradient: AppGradient.purple,
                              textStyle: AppTextStyles.buttonLarge,
                              onCLick: () {
                                controller.signUp.email =
                                    textEditingControllerEmail.text;
                                controller.onCLick(context);
                              },
                            ))
                      ]),
                    )
                  ]),
            )),
          )),
    );
  }
}
