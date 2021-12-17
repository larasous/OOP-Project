import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/SingUp4/sing4_page.dart';
import 'package:petservice_oop_app/shared/model/signUp_model.dart';
import 'package:petservice_oop_app/shared/widget/photoPicker_widget.dart';

class SignUpPage3controller extends SignUp {
  SignUp signUpModel;
  TextEditingController textEditingControllerCep,
      textEditingControllerLogradouro,
      textEditingControllerNumero,
      textEditingControllerBairro,
      textEditingControllerComplemento,
      textEditingControllerCidade,
      textEditingControllerEstado;

  SignUpPage3controller() {
    textEditingControllerCep = TextEditingController();
    textEditingControllerLogradouro = TextEditingController();
    textEditingControllerNumero = TextEditingController();
    textEditingControllerBairro = TextEditingController();
    textEditingControllerComplemento = TextEditingController();
    textEditingControllerCidade = TextEditingController();
    textEditingControllerEstado = TextEditingController();
  }

  submiteData(BuildContext context) {
    addInfos(
        cep: textEditingControllerCep.text,
        logradouro: textEditingControllerLogradouro.text,
        numero: textEditingControllerNumero.text,
        bairro: textEditingControllerBairro.text,
        complemento: textEditingControllerComplemento.text,
        cidade: textEditingControllerCidade.text,
        estado: textEditingControllerEstado.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SingupPage4()));
  }
}
