import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:petservice_oop_app/shared/model/pet.dart';

class DateInterval {
  Hour start;
  Hour end;
  DateInterval({
    this.start,
    this.end,
  });
}

class Scheduled {
  List<Pet> pets;
  bool isVimPegar;
  DateInterval interval;

  Scheduled({
    this.pets = const [],
    this.isVimPegar = false,
    this.interval,
  });
}

class Hour {
  final DateTime dateTime;
  bool isSelected;
  Hour({this.dateTime, this.isSelected = false});

  Map<String, bool> toMap() {
    return {
      DateFormat('HH:mm').format(this.dateTime).toString(): isSelected,
    };
  }
}

class Day {
  bool isStartDaySelected;
  bool isEndDaySelected;
  final int weekDay;
  final int day;

  List<Hour> hours = [];

  String get weekDayName {
    switch (this.weekDay) {
      case 1:
        return "SEG";
      case 2:
        return "TER";
      case 3:
        return "QUA";
      case 4:
        return "QUI";
      case 5:
        return "SEX";
      case 6:
        return "SAB";
      case 7:
        return "DOM";
      default:
        return "";
    }
  }

  Day(
      {this.isStartDaySelected = false,
      this.isEndDaySelected = false,
      this.weekDay,
      this.day,
      this.hours});
}

class Month {
  bool isSelected;
  int year;
  int month;
  List<Day> days;

  String get monthName {
    switch (this.month) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Setembro";
      case 10:
        return "Outubro";
      case 11:
        return "Novembro";
      case 12:
        return "Dezembro";
      default:
        return "";
    }
  }

  Month({
    this.isSelected = false,
    this.year,
    this.month,
    this.days,
  });
}
