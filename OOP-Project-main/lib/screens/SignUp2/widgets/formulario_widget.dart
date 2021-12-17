import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/HomePetSitter/home_page.dart';
import 'package:petservice_oop_app/shared/model/signUp_model.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';
import '../sign_controller.dart';

class FormularioWidget extends StatefulWidget {
  final SignUp signUp;

  const FormularioWidget({Key key, this.signUp}) : super(key: key);

  @override
  _FormularioWidgetState createState() => _FormularioWidgetState();
}

class _FormularioWidgetState extends State<FormularioWidget> {
  GlobalKey<FormState> _key = new GlobalKey();

  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskPhone = MaskTextInputFormatter(
      mask: "(##) # ####-####", filter: {"#": RegExp(r'[0-9]')});

  var controller;

  @override
  void initState() {
    controller = SignUpController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 25),
            TextInputWidget(
              textEditingController: controller.textEditingControllerNome,
              hintText: "Nome",
              //value: widget.signUp.nome,
              inputType: TextInputType.name,
            ),
            SizedBox(height: 13),
            TextInputWidget(
              textEditingController: controller.textEditingControllerSobrenome,
              hintText: "Sobrenome",
              // value: widget.signUp.sobrenome,
              inputType: TextInputType.name,
            ),
            SizedBox(height: 13),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextInputWidget(
                      textEditingController:
                          controller.textEditingControllerCPF,
                      hintText: "CPF",
                      validator: controller.validarCPF,

                      ///value: widget.signUp.cpf,
                      mask: maskCpf,
                      inputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    flex: 2,
                    child: TextInputWidget(
                      textEditingController:
                          controller.textEditingControllerCelular,
                      hintText: "Celular",
                      validator: controller.validarCelular,
                      //value: widget.signUp.celular,
                      mask: maskPhone,
                      inputType: TextInputType.number,
                    ),
                  )
                ]),
            Padding(
                padding: EdgeInsets.only(top: 26),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: new Container(
                      width: 318,
                      height: 30,
                      alignment: Alignment.topLeft,
                      child: new Text(
                        'Documentação',
                        style: AppTextStyles.signSubTitle,
                      ),
                    ))),
            Align(
                alignment: Alignment.topLeft,
                child: new Container(
                  height: 24,
                  alignment: Alignment.topLeft,
                  child: new Text(
                    'Qualquer documento de identificação emitido pelo governo brasileiro RG, CNH, Passaporte, Carteira de Trabalho.',
                    style: AppTextStyles.signDescription,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 21),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 200,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    borderRadius: BorderRadius.circular(7)),
                                child: ElevatedButton(
                                  onPressed: null,
                                  child: new Text(
                                    'RG- Frente',
                                    style:
                                        AppTextStyles.signDocumentationCardInfo,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.lightGray,
                                    borderRadius: BorderRadius.circular(7)),
                                width: 200,
                                height: 100,
                                child: ElevatedButton(
                                    onPressed: null,
                                    child: new Text(
                                      'RG-Costas',
                                      style: AppTextStyles
                                          .signDocumentationCardInfo,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
                padding: EdgeInsets.only(top: 28, bottom: 22),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: ButtonWidget(
                        onCLick: () {
                          controller.sendForm(context, _key);
                        },
                        text: "Seguir",
                        gradient: AppGradient.purple,
                        textStyle: AppTextStyles.buttonLarge)))
          ],
        ),
      ),
    );
  }
}
