import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/model/day.dart';
import 'package:petservice_oop_app/shared/model/pet.dart';
import 'package:petservice_oop_app/shared/widget/text_input_widget.dart';
import 'package:petservice_oop_app/shared/widget/toggleButton_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'widgets/AlertAddPetProfile.dart';

class PetProfile extends StatefulWidget {
  final ValueChanged<List<Pet>> onPetsSelectedChanged;
  List<Pet> pets;
  List<Pet> get _petsSelected => pets.where((pet) => pet.isSelected).toList();
  Pet _pet;
  PetProfile({Key key, this.pets, this.onPetsSelectedChanged})
      : super(key: key);

  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  Alert alertEditPet(BuildContext context, int index) {
    return Alert(
        title: "",
        context: context,
        style: AlertStyle(
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            overlayColor: AppColors.overlayAlert),
        content: AlertAddPetProfile(
          petUpdate: widget.pets[index],
          onPetChanged: (p) {
            widget._pet = p;
          },
        ),
        buttons: [
          DialogButton(
            color: AppColors.green,
            onPressed: () {
              setState(() {
                widget.pets[index] = widget._pet;
              });
              widget._pet = null;
              Navigator.pop(context);
            },
            child: Text(
              "Salvar Alteração",
              style: AppTextStyles.buttonSmall,
            ),
          ),
          DialogButton(
            color: AppColors.red,
            onPressed: () {
              setState(() {
                widget.pets.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text(
              "Apagar",
              style: AppTextStyles.buttonSmall,
            ),
          )
        ]);
  }

  Alert alertAddNewPet(BuildContext context) {
    return Alert(
        title: "",
        context: context,
        style: AlertStyle(
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            overlayColor: AppColors.overlayAlert),
        content: AlertAddPetProfile(
          onPetChanged: (p) {
            widget._pet = p;
          },
        ),
        buttons: [
          DialogButton(
            color: AppColors.green,
            onPressed: () {
              setState(() {
                widget.pets.add(widget._pet);
              });
              widget._pet = null;
              Navigator.pop(context);
            },
            child: Text(
              "Salvar",
              style: AppTextStyles.buttonLarge,
            ),
          )
        ]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._pet = Pet();
    widget.pets = List<Pet>.filled(0, Pet(), growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 85,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 17),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => index < (widget.pets?.length ?? -1)
            ? GestureDetector(
                onLongPress: () {
                  alertEditPet(context, index).show();
                },
                onTap: () {
                  setState(() {
                    widget.pets[index].isSelected =
                        !widget.pets[index].isSelected;
                    widget.onPetsSelectedChanged.call(widget._petsSelected);
                  });
                },
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: widget.pets[index].image != null
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.lightPurple,
                                    backgroundImage:
                                        FileImage(widget.pets[index].image),
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.lightPurple,
                                    child: Center(
                                      child: Text(
                                        widget.pets[index].name[0]
                                            .toUpperCase(),
                                        style: AppTextStyles
                                            .clientHomePetProfileAvatarLetter,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        widget.pets[index].isSelected
                            ? Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.purple,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(51, 51)),
                                ))
                            : Container(width: 60, height: 60)
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.pets[index].name,
                      style: widget.pets[index].isSelected
                          ? AppTextStyles.clientHomePetProfileNameSelected
                          : AppTextStyles.clientHomePetProfileName,
                    )
                  ],
                ),
              )
            : MaterialButton(
                onPressed: () {
                  alertAddNewPet(context).show();
                },
                minWidth: 27,
                height: 27,
                shape: CircleBorder(),
                child: Icon(Icons.add_circle_rounded, color: AppColors.purple),
              ),
        separatorBuilder: (_, index) =>
            Padding(padding: EdgeInsets.only(right: 27)),
        itemCount: (widget.pets?.length ?? 0) + 1,
      ),
    );
  }
}
