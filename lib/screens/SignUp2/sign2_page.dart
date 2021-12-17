import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/widget/photoPicker_widget.dart';
import 'package:petservice_oop_app/shared/widget/toggleButton_widget.dart';
import 'widgets/formulario_widget.dart';
import 'widgets/toggle.dart';

class SignupPage2 extends StatefulWidget {
  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: new Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            toolbarHeight: 0,
          ),
          backgroundColor: AppColors.backgroundColor,
          body: new SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 39),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: new Text('Cadastro',
                            style: AppTextStyles.splashTitle),
                      ),
                      SizedBox(height: 2),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: new Text(
                            'Queremos lhe conhecer',
                            style: AppTextStyles.signSubTitle,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 13),
                PhotoPickerWidget(
                  file: file,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 119, top: 16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 220,
                          height: 15,
                          margin: EdgeInsets.only(right: 119),
                          child: new Text(
                            'Você é um',
                            style: AppTextStyles.signDescription,
                          ),
                        ),
                      ),
                      SizedBox(height: 17),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: ToggleWidget(),
                ),
                FormularioWidget(),
              ],
            ),
          )))),
    ));
  }
}
