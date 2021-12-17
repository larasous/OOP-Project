import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/Login/login_page.dart';
import '../../core/core.dart';
import '../../shared/widget/text_input_widget.dart';
import '../../shared/widget/button_widget.dart';

class SingupPage4 extends StatefulWidget {
  @override
  _SingupPage4State createState() => _SingupPage4State();
}

class _SingupPage4State extends State<SingupPage4> {
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
                padding: const EdgeInsets.only(right: 20, left: 20),
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
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Sobre o pagamento",
                            style: AppTextStyles.signSubTitle,
                          ),
                        ),
                        SizedBox(
                          height: 46,
                        ),
                        Container(
                          width: 237,
                          height: 147,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 66, left: 57),
                          ),
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.darkGray,
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        SizedBox(
                          height: 57,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextInputWidget(
                            hintText: "Número do Cartão",
                            inputType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextInputWidget(
                                hintText: "Data Validade",
                                inputType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              flex: 2,
                              child: TextInputWidget(
                                hintText: "Código segurança",
                                inputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 134,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ButtonWidget(
                            onCLick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            text: "Finalizar cadastro",
                            textStyle: AppTextStyles.buttonLarge,
                            gradient: AppGradient.purple,
                            color: AppColors.purple,
                          ),
                        ),
                      ],
                    )
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
