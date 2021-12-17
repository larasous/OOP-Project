import 'package:flutter/foundation.dart';
import 'package:petservice_oop_app/shared/model/day.dart';
import 'package:intl/intl.dart';

class AgendaController extends ChangeNotifier {
  List<Month> _months;

  List<Hour> get hoursStartDay => _months
      .firstWhere((element) => element.isSelected)
      .days
      .firstWhere((element) => element.isStartDaySelected, orElse: () => Day())
      .hours;

  List<Hour> get hoursEndDay {
    return _months
        .firstWhere((element) => element.isSelected)
        .days
        .firstWhere((element) => element.isEndDaySelected, orElse: () => Day())
        .hours;
  }

  List<Day> get days =>
      _months.firstWhere((element) => element.isSelected).days;
  Month get month => _months.firstWhere((element) => element.isSelected);

  AgendaController() {
    generateMonths();
    _months[0].isSelected = true;
  }

  void generateMonths() {
    DateTime now = DateTime.now();

    _months = List.generate(13, (i) {
      DateTime startDate = DateTime.utc(
          now.year,
          now.month + i,
          now.hour < 18 ? now.day : now.day + 1,
          now.hour < 18 ? now.hour : 7,
          0);

      DateTime startDateDiffer = DateTime.utc(
          now.year,
          now.month + i,
          i > 0
              ? 1
              : now.hour < 18
                  ? now.day
                  : now.day + 1,
          DateTime.now().hour < 18 ? DateTime.now().hour : 7,
          0);

      return Month(
          year: startDate.year,
          month: startDate.month,
          days: List.generate(30, (j) {
            DateTime nextDate = DateTime.utc(startDate.year, startDate.month,
                    startDate.day, j > 0 || i > 0 ? 7 : startDate.hour, 0)
                .subtract(startDate.difference(startDateDiffer))
                .add(Duration(days: j));
            if (nextDate.month == startDate.month) {
              DateTime startTime = nextDate;
              DateTime lastTime =
                  DateTime(nextDate.year, nextDate.month, nextDate.day, 16, 0);

              return Day(
                  weekDay: nextDate.weekday,
                  day: nextDate.day,
                  hours: List.generate(lastTime.difference(startTime).inHours,
                      (k) {
                    return Hour(
                      dateTime: startTime.add(Duration(hours: k)),
                    );
                  }));
            }
          }).whereType<Day>().toList());
    });

    _months.removeWhere((month) => month.days.isEmpty);

    _months.forEach((month) {
      month.days.removeWhere((day) => day.hours.isEmpty);
    });
  }

  void toogleButtonNextMonth() {
    int currentIndex = _months.indexWhere((element) => element.isSelected);
    _months[currentIndex].isSelected = false;

    if (currentIndex < _months.length - 1) {
      _months[currentIndex + 1].isSelected = true;
    } else {
      _months[0].isSelected = true;
    }
    notifyListeners();
  }

  void toogleButtonPreviousMonth() {
    int currentIndex = _months.indexWhere((element) => element.isSelected);
    _months[currentIndex].isSelected = false;

    if (currentIndex > 0) {
      _months[currentIndex - 1].isSelected = true;
    } else {
      _months[_months.length - 1].isSelected = true;
    }
    notifyListeners();
  }

  int getStarDayIndex() {
    int x = 1;

    int soma = _months.fold(
        0, (previousValue, month) => previousValue + month.days.length);

    int indexStartDay = _months.fold(0, (previousValue, element) {
      int currentIndex =
          element.days.indexWhere((element) => element.isStartDaySelected);
      if (currentIndex >= 0) {
        x = 0;
        return previousValue + currentIndex;
      } else {
        return previousValue + x * element.days.length;
      }
    });

    return indexStartDay < soma ? indexStartDay : -1;
  }

  int getEndDayIndex() {
    int x = 1;
    int soma = _months.fold(
        0, (previousValue, month) => previousValue + month.days.length);

    int indexEndDay = _months.fold(0, (previousValue, element) {
      int currentIndex =
          element.days.indexWhere((element) => element.isEndDaySelected);
      if (currentIndex >= 0) {
        x = 0;
        return previousValue + currentIndex;
      } else {
        return previousValue + x * element.days.length;
      }
    });

    return indexEndDay < soma ? indexEndDay : -1;
  }

  void toogleButtonStarDay(int index) {
    int starDayIndex, endDayIndex = 0;
    _months = _months.map((month) {
      month.days = month.days.map((day) {
        if (month.isSelected) {
          if (index == month.days.indexOf(day)) {
            day.isStartDaySelected = true;
            starDayIndex = getStarDayIndex();
            endDayIndex = getEndDayIndex();
            if (endDayIndex != -1 && (starDayIndex > endDayIndex)) {
              day.isStartDaySelected = false;
            }
          } else {
            day.isStartDaySelected = false;
          }
        } else {
          day.isStartDaySelected = false;
        }
        return day;
      }).toList();

      return month;
    }).toList();

    notifyListeners();
  }

  void toogleButtonEndDay(int index) {
    int starDayIndex, endDayIndex = 0;

    _months = _months.map((month) {
      month.days = month.days.map((day) {
        if (month.isSelected) {
          if (index == month.days.indexOf(day)) {
            day.isEndDaySelected = true;
            starDayIndex = getStarDayIndex();
            endDayIndex = getEndDayIndex();
            if (endDayIndex != -1 && (starDayIndex > endDayIndex)) {
              day.isEndDaySelected = false;
            }
          } else {
            day.isEndDaySelected = false;
          }
        } else {
          day.isEndDaySelected = false;
        }
        return day;
      }).toList();

      return month;
    }).toList();

    notifyListeners();
  }
}
