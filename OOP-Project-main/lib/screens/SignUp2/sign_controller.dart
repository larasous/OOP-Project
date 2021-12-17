import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petservice_oop_app/screens/SignUp3/sign3_page.dart';
import 'package:petservice_oop_app/shared/model/signUp_model.dart';
import 'widgets/toggle.dart';

class SignUpController extends SignUp {
  String validarNome(String value) {
    String pattern = r'(^[a-zA-Z]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Inválido tente novamente';
    } else if (!regExp.hasMatch(value)) {
      return 'Caracteres inválidos';
    }
    return null;
  }

  String validarSobrenome(String value) {
    String pattern = r'(^[a-zA-Z , ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Inválido tente novamente';
    } else if (!regExp.hasMatch(value)) {
      return 'Caracteres inválidos';
    }
    return null;
  }

  String validarCPF(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Inválido tente novamente';
    } else if (value.length != 11) {
      return 'CPF incompleto';
    } else if (!regExp.hasMatch(value)) {
      return 'Caracteres inválidos';
    }
    return null;
  }

  String validarCelular(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Inválido tente novamente';
    } else if (value.length != 12) {
      return 'Celular incompleto';
    } else if (!regExp.hasMatch(value)) {
      return 'Caracteres inválidos';
    }
    return null;
  }

  TextEditingController textEditingControllerNome,
      textEditingControllerSobrenome,
      textEditingControllerCPF,
      textEditingControllerCelular;
  bool petsitter = false;
  File file;

  SignUpController() {
    textEditingControllerNome = TextEditingController();
    textEditingControllerSobrenome = TextEditingController();
    textEditingControllerCPF = TextEditingController();
    textEditingControllerCelular = TextEditingController();
  }

  isPetsitter() {
    petsitter = true;
    addPetsitter(petsitter: petsitter);
  }

  isCliente() {
    petsitter = false;
    addPetsitter(petsitter: petsitter);
  }

  sendForm(BuildContext context, GlobalKey<FormState> key) async {
    addUser(
      nome: textEditingControllerNome.text,
      sobrenome: textEditingControllerSobrenome.text,
      cpf: textEditingControllerCPF.text,
      celular: textEditingControllerCelular.text,
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SingUpPage3()));
  }
}
