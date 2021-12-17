import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';

class ToggleWidget extends StatefulWidget {
  final ValueChanged<bool> onVimPegarChanged;
  ToggleWidget({Key key, this.onVimPegarChanged}) : super(key: key);

  @override
  _ToggleWidgetState createState() => _ToggleWidgetState();
}

class _ToggleWidgetState extends State<ToggleWidget> {
  bool isVimPegar = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      height: 37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
              color: AppColors.grayShadow, offset: Offset(0, 4), blurRadius: 4)
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isVimPegar = true;
                widget.onVimPegarChanged.call(true);
              });
            },
            child: (isVimPegar
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.grayShadow,
                            offset: Offset(5, 0),
                            blurRadius: 13)
                      ],
                      border: Border.all(
                        color: AppColors.purple,
                        width: 1,
                      ),
                      color: AppColors.lightPurple,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Vim pegar",
                      style: AppTextStyles.clientHomeToggleSelected,
                    )),
                  )
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "Vim pegar",
                      style: AppTextStyles.clientHomeToggle,
                    )),
                  )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isVimPegar = false;
                widget.onVimPegarChanged.call(false);
              });
            },
            child: !isVimPegar
                ? AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.grayShadow,
                              offset: Offset(-5, 0),
                              blurRadius: 13)
                        ],
                        border: Border.all(
                          color: AppColors.purple,
                          width: 1,
                        ),
                        color: AppColors.lightPurple,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(7),
                        )),
                    child: Center(
                        child: Text("Ir deixar",
                            style: AppTextStyles.clientHomeToggleSelected)))
                : AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    width: 85,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(7),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(7),
                        )),
                    child: Center(
                        child: Text("Ir deixar",
                            style: AppTextStyles.clientHomeToggle))),
          )
        ],
      ),
    );
  }
}
