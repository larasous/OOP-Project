import 'package:flutter/material.dart';

class SetDayCell extends StatelessWidget {
  final bool isSelected;
  final Color color;
  const SetDayCell({Key key, this.isSelected, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Container(
            width: 36,
            child: Divider(
              color: color,
              thickness: 3,
            ),
          )
        : Container(
            width: 37,
            decoration: BoxDecoration(color: Colors.transparent),
          );
  }
}
