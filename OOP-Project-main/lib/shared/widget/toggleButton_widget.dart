import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToggleButtonWidget extends StatefulWidget {
  final TextStyle font;
  final TextStyle fontSelected;
  List<Map<String, bool>> items;
  final Color backgroundColor;
  final Color color;
  final ValueChanged<int> onIndexChanged;

  ToggleButtonWidget(
      {Key key,
      @required this.color,
      @required this.font,
      @required this.fontSelected,
      @required this.items,
      this.backgroundColor = Colors.transparent,
      this.onIndexChanged})
      : super(key: key);

  @override
  _ToggleButtonWidgetState createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 16,
      child: ListView.separated(
          padding: EdgeInsets.only(left: 30),
          scrollDirection: Axis.horizontal,
          itemCount: widget.items.length,
          separatorBuilder: (_, index) =>
              Padding(padding: EdgeInsets.only(right: 18.94)),
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                toogle(index);
              },
              child: Container(
                  child: Center(
                    child: Text(widget.items[index].keys.elementAt(0),
                        style: widget.items[index].values.elementAt(0)
                            ? widget.fontSelected
                            : widget.font),
                  ),
                  width: 51,
                  decoration: BoxDecoration(
                      color: widget.items[index].values.elementAt(0)
                          ? widget.color
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: widget.color))))),
    );
  }

  void toogle(int index) {
    setState(() {
      widget.items.asMap().forEach((i, element) {
        element.forEach((key, value) {
          if (i == index) {
            widget.items[i][key] = true;
          } else {
            widget.items[i][key] = false;
          }
        });
      });
      widget.onIndexChanged.call(index);
    });
  }
}
