import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';
import 'package:petservice_oop_app/screens/HomeClient/widgets/agenda/agenda_controller.dart';
import 'package:petservice_oop_app/screens/HomeClient/widgets/agenda/widgets/Days_Cell.dart';
import 'package:petservice_oop_app/shared/model/day.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:petservice_oop_app/shared/widget/button_widget.dart';
import 'package:petservice_oop_app/shared/widget/toggleButton_widget.dart';
import 'package:provider/provider.dart';
import 'widgets/StartDay_Cell.dart';

class AgendaWidget extends StatefulWidget {
  final ValueChanged<DateInterval> onIntervalChanged;
  AgendaWidget({Key key, this.onIntervalChanged}) : super(key: key);

  @override
  _AgendaWidgetState createState() => _AgendaWidgetState();
}

class _AgendaWidgetState extends State<AgendaWidget> {
  DateInterval dateInterval;
  LinkedScrollControllerGroup _controllers;
  ScrollController _a, _b, _c;

  @override
  void initState() {
    _controllers = LinkedScrollControllerGroup();
    _a = _controllers.addAndGet();
    _b = _controllers.addAndGet();
    _c = _controllers.addAndGet();
    dateInterval = DateInterval();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final agendaController = Provider.of<AgendaController>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [AppShadow.calendarBox],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17),
            topRight: Radius.circular(17),
          ),
          color: AppColors.white),
      child: Column(
        children: [
          SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(children: [
              Text(
                "Agenda",
                style: AppTextStyles.clientHomeAgendaTitle,
              ),
              Text(
                " / ${agendaController.month.year}",
                style: AppTextStyles.clientHomeAgendaTitleYear,
              ),
              Spacer(),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      agendaController.toogleButtonPreviousMonth();
                    },
                    minWidth: 27,
                    height: 27,
                    shape: CircleBorder(),
                    child: Icon(Icons.navigate_before_outlined),
                  ),
                  Text(agendaController.month.monthName,
                      style: AppTextStyles.clientHomeAgendaMonth),
                  MaterialButton(
                      onPressed: () {
                        agendaController.toogleButtonNextMonth();
                      },
                      minWidth: 27,
                      height: 27,
                      shape: CircleBorder(),
                      child: Icon(Icons.navigate_next_outlined)),
                ],
              )
            ]),
          ),
          SizedBox(height: 16.07),
          Stack(
            children: [
              Divider(
                color: AppColors.gray,
              ),
              LimitedBox(
                maxHeight: 20,
                child: ListView.separated(
                    controller: _a,
                    padding: EdgeInsets.only(left: 30),
                    scrollDirection: Axis.horizontal,
                    itemCount: agendaController.days.length,
                    separatorBuilder: (_, index) =>
                        Padding(padding: EdgeInsets.only(right: 10)),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            agendaController.toogleButtonStarDay(index);
                            widget.onIntervalChanged.call(null);
                          },
                          child: SetDayCell(
                            isSelected:
                                agendaController.days[index].isStartDaySelected,
                            color: AppColors.purple,
                          ),
                        )),
              ),
            ],
          ),
          SizedBox(height: 10.03),
          LimitedBox(
            maxHeight: 60.93,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 34),
              controller: _b,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => DaysCell(
                  day: agendaController.days[index],
                  isSelected: agendaController.days[index].isStartDaySelected ||
                      agendaController.days[index].isEndDaySelected),
              separatorBuilder: (_, index) =>
                  Padding(padding: EdgeInsets.only(right: 21)),
              itemCount: agendaController.days.length,
            ),
          ),
          SizedBox(height: 10.03),
          Stack(
            children: [
              Divider(
                color: AppColors.gray,
              ),
              LimitedBox(
                maxHeight: 20,
                child: ListView.separated(
                    controller: _c,
                    padding: EdgeInsets.only(left: 30),
                    scrollDirection: Axis.horizontal,
                    itemCount: agendaController.days.length,
                    separatorBuilder: (_, index) =>
                        Padding(padding: EdgeInsets.only(right: 10)),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            agendaController.toogleButtonEndDay(index);
                            widget.onIntervalChanged.call(null);
                          },
                          child: SetDayCell(
                            isSelected:
                                agendaController.days[index].isEndDaySelected,
                            color: AppColors.orange,
                          ),
                        )),
              ),
            ],
          ),
          SizedBox(height: 11.56),
          ToggleButtonWidget(
            onIndexChanged: (index) {
              dateInterval.start = agendaController.hoursStartDay[index];
              widget.onIntervalChanged.call(dateInterval);
            },
            color: AppColors.purple,
            font: AppTextStyles.tagBox,
            items: agendaController.hoursStartDay
                    ?.map((e) => e.toMap())
                    ?.toList() ??
                [],
            fontSelected: AppTextStyles.tagBoxSelected,
          ),
          SizedBox(height: 9.46),
          ToggleButtonWidget(
            onIndexChanged: (index) {
              dateInterval.end = agendaController.hoursEndDay[index];
              widget.onIntervalChanged.call(dateInterval);
            },
            color: AppColors.orange,
            font: AppTextStyles.tagBox,
            items:
                agendaController.hoursEndDay?.map((e) => e.toMap())?.toList() ??
                    [],
            fontSelected: AppTextStyles.tagBoxSelected,
          ),
          SizedBox(height: 10.67),
        ],
      ),
    );
  }

  // ignore: unused_element
  void _scrollListener() {
    /* print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        days.addAll([
          Day(weekDay: "SEG", day: 14),
          Day(weekDay: "TER", day: 15),
          Day(weekDay: "QUA", day: 16),
          Day(weekDay: "QUI", day: 17),
          Day(weekDay: "SEX", day: 18),
          Day(weekDay: "SÁB", day: 19),
          Day(weekDay: "DOM", day: 20),
        ]);
      });
    }*/
  }
}
