import 'dart:io';

enum Gender { female, male }
enum AnimalType { cachorro, gato, passaro, outros }

class Pet {
  bool isSelected;
  File image;
  String name;
  String date;
  Gender gender;
  AnimalType type;
  Pet({
    this.isSelected = false,
    this.image = null,
    this.name,
    this.date,
    this.gender,
    this.type,
  });
}
