import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onCLick;
  final double width;
  final String text;
  final LinearGradient gradient;
  final Color color;
  final TextStyle textStyle;

  ButtonWidget(
      {Key key,
      this.onCLick,
      this.width,
      this.text,
      this.gradient,
      this.color,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Container(
            width: width,
            height: 40,
            child: new ElevatedButton(
                onPressed: onCLick,
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                child: Ink(
                    decoration: BoxDecoration(
                        color: color,
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(7)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    )))));
  }
}
