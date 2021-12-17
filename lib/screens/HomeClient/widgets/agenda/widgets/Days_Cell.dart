import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/shared/model/day.dart';

class DaysCell extends StatelessWidget {
  final Day day;
  final bool isSelected;
  DaysCell({Key key, @required this.day, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day.weekDayName,
            style: isSelected
                ? AppTextStyles.clientHomeAgendaWeekDaySelected
                : AppTextStyles.clientHomeAgendaWeekDay),
        SizedBox(height: 14.71),
        Text(day.day.toString(),
            style: isSelected
                ? AppTextStyles.clientHomeAgendaDaySelected
                : AppTextStyles.clientHomeAgendaDay),
      ],
    );
  }
}
