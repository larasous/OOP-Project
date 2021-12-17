import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/SignUp3/sign_controller2.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import '../../shared/widget/text_input_widget.dart';

class SingUpPage3 extends StatefulWidget {
  const SingUpPage3({Key key}) : super(key: key);

  @override
  _SingUpPage3State createState() => _SingUpPage3State();
}

class _SingUpPage3State extends State<SingUpPage3> {
  // ignore: unused_field
  GlobalKey<FormState> _key = new GlobalKey();
  var controller;

  void initState() {
    controller = SignUpPage3controller();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: AppColors.backgroundColor,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 39,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Cadastro",
                              style: AppTextStyles.splashTitle),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Onde você reside?",
                            style: AppTextStyles.signSubTitle,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 52,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 141,
                            height: 40,
                            child: TextInputWidget(
                              hintText: "CEP",
                              textEditingController:
                                  controller.textEditingControllerCep,
                              inputType: TextInputType.number,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextInputWidget(
                            hintText: "Logradouro",
                            textEditingController:
                                controller.textEditingControllerLogradouro,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextInputWidget(
                                hintText: "Número",
                                textEditingController:
                                    controller.textEditingControllerNumero,
                                inputType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextInputWidget(
                                hintText: "Bairro",
                                textEditingController:
                                    controller.textEditingControllerBairro,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: TextInputWidget(
                              hintText: "Complemento",
                              textEditingController:
                                  controller.textEditingControllerComplemento,
                            )),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 2,
                                child: TextInputWidget(
                                  hintText: "Cidade",
                                  textEditingController:
                                      controller.textEditingControllerCidade,
                                )),
                            SizedBox(
                              width: 11,
                            ),
                            Expanded(
                                flex: 2,
                                child: TextInputWidget(
                                  hintText: "Estado",
                                  textEditingController:
                                      controller.textEditingControllerEstado,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ButtonWidget(
                            onCLick: () {
                              controller.submiteData(context);
                            },
                            text: "Seguir",
                            textStyle: AppTextStyles.buttonLarge,
                            gradient: AppGradient.purple,
                            color: AppColors.purple,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
