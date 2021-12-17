import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/model/pet.dart';
import 'package:petservice_oop_app/shared/widget/photoPicker_widget.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AlertAddPetProfile extends StatefulWidget {
  Pet _pet;
  Pet petUpdate;
  final ValueChanged<Pet> onPetChanged;
  AlertAddPetProfile({Key key, this.onPetChanged, this.petUpdate})
      : super(key: key);
  @override
  _AlertAddPetProfileState createState() => _AlertAddPetProfileState();
}

class _AlertAddPetProfileState extends State<AlertAddPetProfile> {
  final _picker = ImagePicker();
  final TextEditingController txtNomeController = TextEditingController();
  final TextEditingController txtDataController = TextEditingController();

  List<Map<String, AnimalType>> petTypes = [
    {'🐶': AnimalType.cachorro},
    {'😺': AnimalType.gato},
    {'🦜': AnimalType.passaro},
    {'Outro': AnimalType.outros}
  ];

  List<Map<String, Gender>> petGenders = [
    {'Fêmea': Gender.female},
    {'Macho': Gender.male}
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._pet = Pet();
    txtNomeController.text = widget.petUpdate?.name ?? "";
    txtDataController.text = widget.petUpdate?.date ?? "";
    txtNomeController.addListener(() {
      widget._pet.name = txtNomeController.text;
      widget.onPetChanged.call(widget._pet);
    });
    txtDataController.addListener(() {
      widget._pet.date = txtDataController.text;
      widget.onPetChanged.call(widget._pet);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PhotoPickerWidget(
          file: widget.petUpdate?.image ?? null,
          onfilePathChanged: (file) {
            widget._pet.image = file;
            widget.onPetChanged.call(widget._pet);
          },
        ),
        SizedBox(height: 20),
        TextInputWidget(
            textEditingController: txtNomeController,
            hintText: "Nome",
            inputType: TextInputType.emailAddress),
        SizedBox(height: 16),
        TextInputWidget(
            textEditingController: txtDataController,
            hintText: "Data de nascimento",
            mask: MaskTextInputFormatter(
                mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')}),
            inputType: TextInputType.datetime),
        SizedBox(height: 24),
        ToggleSwitch(
          minHeight: 19,
          minWidth: 53,
          activeBgColor: [AppColors.orange],
          activeFgColor: AppColors.darkOrange,
          inactiveFgColor: AppColors.darkGray,
          inactiveBgColor: AppColors.lightGray,
          cornerRadius: 9,
          fontSize: 11,
          initialLabelIndex: petTypes.indexWhere((petType) =>
              petType.values.first ==
              (widget.petUpdate?.type ?? AnimalType.cachorro)),
          totalSwitches: petTypes.length,
          labels: petTypes.map((e) => e.keys.first).toList(),
          onToggle: (index) {
            widget._pet.type = petTypes[index].values.first;
            widget.onPetChanged.call(widget._pet);
          },
        ),
        SizedBox(height: 12),
        ToggleSwitch(
          minHeight: 19,
          activeBgColor: [AppColors.lightPurple],
          activeFgColor: AppColors.darkPurple,
          inactiveFgColor: AppColors.darkGray,
          inactiveBgColor: AppColors.lightGray,
          cornerRadius: 9,
          fontSize: 11,
          initialLabelIndex: petGenders.indexWhere((petGender) =>
              petGender.values.first ==
              (widget.petUpdate?.gender ?? Gender.female)),
          totalSwitches: petGenders.length,
          labels: petGenders.map((e) => e.keys.first).toList(),
          onToggle: (index) {
            widget._pet.gender = petGenders[index].values.first;
            widget.onPetChanged.call(widget._pet);
          },
        ),
      ],
    );
  }
}
